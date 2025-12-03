import Database from "better-sqlite3";

const db = new Database('./data/database.sqlite');

db.prepare(`CREATE TABLE IF NOT EXISTS cars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand STRING, 
    model STRING,
    year INTEGER)     
`).run();

export const getAllCars = () => db.prepare("SELECT * FROM cars").all();

export const getCarById = (id) => db.prepare("SELECT * FROM cars WHERE id = ?").get(id);

export const saveCar = (brand, model, year) => db.prepare("INSERT INTO cars (brand, model, year) VALUES (?,?,?)").run(brand, model, year);

export const updateCar = (id, brand, model, year) => db.prepare("UPDATE cars SET brand = ?, model = ?, year = ? WHERE id = ?").run(brand, model, year, id);