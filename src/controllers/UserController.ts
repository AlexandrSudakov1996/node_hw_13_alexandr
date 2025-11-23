import {Request, Response} from "express";
import {userServiceSql} from "../service/UserServiceImplSQL.js";

export class UserController {


    addUser = async (req: Request, res: Response) => {
        const {name, email} = req.body;
        await userServiceSql.addUser({name, email});
        res.status(201).json({message: "User added"});
    }

    getAllUsers = async (req: Request, res: Response) => {
        const users = await userServiceSql.getAllUsers();
        res.json(users);
    }
}

export const userController = new UserController();