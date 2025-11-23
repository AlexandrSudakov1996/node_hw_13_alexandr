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
}

export const userServiceSql = new UserServiceImplSQL();