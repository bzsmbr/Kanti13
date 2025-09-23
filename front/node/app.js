import express from "express";
import * as db from "./util/database.js"

const PORT = 3000;
const app = express();

app.use(express.json());

app.listen(PORT, () => {
    console.log(`Server runs on port: ${PORT}`);
});

app.get("/books", (req, res) => {
    const books = db.getBooks()
    res.status(200).json(books);
});

app.get("/books/:id", (req, res) => {
    const book = db.GetBooksById(+req.params.id)
    if (!book) {
        return res.status(200).json(book)
    }
})

app.post("/books", (req, res) => {
    const { title, author } = req.body;
    if (!title || !author) {
        return res.status(400).json({ message: "Missing title or author" });
    }
    const saveResult = db.saveBook(title, author);
    res.status(200).json({ id: saveResult.lastInsertedRowId, title, author });
})