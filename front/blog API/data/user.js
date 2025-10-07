import db from './database.js';

db.prepare(
    `CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    password TEXT)`,
).run();


export const getUsers = () => db.prepare('SELECT * FROM users');
export const getUsersById = (id) => db.prepare('SELECT * FROM users WHERE id = ?').get(id);
export const getUsersByEmail = (email) => db.prepare('SELECT * FROM users WHERE email = ?').get(email);
export const saveUser = (name, email, password) => db.prepare('INSERT INTO users (name, email, password) VALUES (?,?,?)').run(name, email, password);
export const updateUser = (id, name, email, password) => db.prepare('UPDATE users SET name = ?, email = ?, password = ? WHERE id = ? ').run(name, email, password, id);

