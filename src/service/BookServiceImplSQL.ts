import {BookService} from "./BookService.js";
import {Book} from "../model/book.js";

import {HttpError} from "../errorHandler/HttpError.js";
import {pool} from "../app.js";

export class BookServiceImplSQL implements BookService{
    async addBook(book: Book): Promise<void> {
        const result = await pool.query('INSERT INTO books VALUES(?,?,?,?,?,?)',
            [book._id, book.title, book.author, book.genre, book.status, book.year])
        if(!result)
            throw new HttpError(400, "Can't write book into DB")
    }

    async getAllBooks(): Promise<Book[]> {
        const [books] = await pool.query('SELECT * FROM books');
        return books as Book[];
    }


    async getBookByAuthor(author: string): Promise<Book[]> {
        const [books] = await pool.query('SELECT * FROM books WHERE author = ?', [author]);
        return books as Book[];
    }


    async pickBook(id: string, reader: string, readerId: number): Promise<void> {
        // Проверяем статус книги
        const [bookRows]: any = await pool.query('SELECT status FROM books WHERE id = ?', [id]);
        if (bookRows.length === 0) throw new HttpError(404, "Book not found");
        if (bookRows[0].status !== 'in_stock') throw new HttpError(400, "Book not available");

        // Добавляем запись в books_readers
        await pool.query(
            'INSERT INTO books_readers (book_id, reader_id) VALUES (?, ?)',
            [id, readerId]
        );

        // Обновляем статус книги
        await pool.query('UPDATE books SET status = ? WHERE id = ?', ['on_hand', id]);
    }


    async removeBook(id: string): Promise<Book> {
        const [rows]: any = await pool.query('SELECT * FROM books WHERE id = ?', [id]);
        if (rows.length === 0) throw new HttpError(404, "Book not found");

        const book = rows[0] as Book;

        if (book.status !== 'in_stock') {
            await pool.query('UPDATE books SET status = ? WHERE id = ?', ['removed', id]);
            throw new HttpError(409, "Book is on hand. Marked as REMOVED");
        }

        await pool.query('DELETE FROM books WHERE id = ?', [id]);
        return book;
    }


    async returnBook(id: string): Promise<void> {
        // Обновляем запись в books_readers
        await pool.query(
            'UPDATE books_readers SET return_date = NOW() WHERE book_id = ? AND return_date IS NULL',
            [id]
        );

        // Обновляем статус книги
        await pool.query('UPDATE books SET status = ? WHERE id = ?', ['in_stock', id]);
    }


}

 export const bookServiceSql = new BookServiceImplSQL();