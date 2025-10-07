import db from './database.js';

db.prepare(
    `CREATE TABLE IF NOT EXISTS posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER,
    title TEXT,
    content TEXT,
    FOREIGN KEY (userId) REFERENCES users(id)
    )`,
).run();

export const getPosts = () => db.prepare('SELECT * FROM posts');
export const getPostsByUsers = (userId) => db.prepare('SELECT * FROM posts WHERE userId = ?').get(userId);
export const getPostById = (id) => db.prepare('SELECT * FROM users WHERE id = ?').get(id);
export const getUsersByTitle = (title) => db.prepare('SELECT * FROM users WHERE title = ?').get(title);
export const savePost = (title, content, userId) => db.prepare('INSERT INTO users (name, email, password) VALUES (?,?,?)').run(name, email, password);
export const updateUser = (id, name, email, password) => db.prepare('UPDATE users SET name = ?, email = ?, password = ? WHERE id = ? ').run(name, email, password, id);