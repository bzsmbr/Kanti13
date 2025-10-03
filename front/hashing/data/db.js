import Database from "better-sqlite3";

const db = new Database("./data/database.sqlite");

db.prepare(`CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    email STRING,
    password STRING 
    )`).run();

export const getUsers = () => db.prepare('SELECT * FROM users').all();

export const getUserById = () => db.prepare('SELECT * FROM users WHERE id= ?').get(id);

export const saveUsers = (email, password) => db.prepare('INSERT INTO users (email, password) VALUES (?,?)').run(email, password);

export const updateUsers = (id, email, password) => db.prepare('UPDATE users SET email = ?, password = ?, WHERE id = ?').run(email, password, id);

export const deleteUsers = (id) => db.prepare('DELETE FROM users WHERE id = ?').run(id);

export const getUserByEmail = (email) => db.prepare('SELECT * FROM users WHERE email = ?').run(email);
