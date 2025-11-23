import express from "express";
import {userController} from "../controllers/UserController.js";

export const userRouter = express.Router();

userRouter.post("/", userController.addUser);
userRouter.get("/", userController.getAllUsers);