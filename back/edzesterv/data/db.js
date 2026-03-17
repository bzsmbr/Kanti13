const Database = require("better-sqlite3");

const db = new Database("fitnesz.sql");


db.prepare(`
    CREATE TABLE IF NOT EXISTS edzesek (
        azon INTEGER PRIMARY KEY AUTOINCREMENT,
        nev TEXT NOT NULL,
        tipus TEXT NOT NULL CHECK(tipus IN ('kardio','ero','joga','crossfit')),
        ido INTEGER NOT NULL,
        kaloria INTEGER NOT NULL,
        datum TEXT NOT NULL
    )
`).run();

module.exports = db;