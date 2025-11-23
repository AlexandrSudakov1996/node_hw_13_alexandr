

export type UserDto = {
    name: string;
    email: string;
};

export type User = {
    id?: number;
    name: string;
    email: string;
    booksOnHand?: UserBookRecord[];
};


export type UserBookRecord = {
    bookId: string;
    title: string;
    pickDate: string;
    returnDate: string | null;
};