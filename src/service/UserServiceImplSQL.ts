import {pool} from "../app.js";
import {User, UserDto} from "../model/user.ts";


export class UserServiceImplSQL {
    async addUser(dto: UserDto): Promise<void> {
        await pool.query(
            "INSERT INTO readers (name, email) VALUES (?, ?)",
            [dto.name, dto.email]
        );
    }

    async getAllUsers(): Promise<User[]> {
        const [rows] = await pool.query("SELECT * FROM readers");
        return rows as User[];
    }
    async getUsersWithBooks(): Promise<any[]> {
        const [books] = await pool.query(
            `SELECT r.id, r.name, r.email,
                b.id AS bookId, b.title, b.author, b.genre, b.year, br.pick_date
         FROM readers r
         JOIN books_readers br ON r.id = br.reader_id
         JOIN books b ON b.id = br.book_id
         WHERE br.return_date IS NULL AND b.status = 'on_hand'`
        );
        return books as any[];
    }


}



export const userServiceSql = new UserServiceImplSQL();