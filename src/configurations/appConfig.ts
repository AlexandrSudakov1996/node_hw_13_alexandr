import mysql from "mysql2/promise"
import dotenv from "dotenv";

 export  const PORT = 3050;
export const DB = "mongodb+srv://alexandrsudakov24_db_user:0Xq60wLM0HPsvzTp@cluster0.g4g7hon.mongodb.net/library?appName=Cluster0"

 export const createSqlPool = () => {
    return mysql.createPool({
         host:process.env.SQL_HOST,
         port: +process.env.SQL_PORT!,
         user:process.env.SQL_USER || "root",
         password:process.env.SQL_PASSWORD,
         database:process.env.SQL_DB_NAME
     })
 }

