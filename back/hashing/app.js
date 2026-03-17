import express from "express"
import cors from "cors"
import bcrypt from "bcrypt"

const PORT = 3000;

const app = express();

app.use(express.json());
app.use(cors());
app.use(express.static('public'));

app.get("/users", (req, res) => {
    const users = db.getUsers();
    res.json(users);
});

app.get("/users/:id", (req, res) => {
    const users = db.getUserById(+req.params.id);
    if (!users) {
        return res.status(404).json({ message: "User not found" });
    }
    res.json(users);
});

/*
app.get("/users", async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(404).json({ message: "Data not found" });
    }

    const salt = await bcrypt.genSalt(7); //jelszo titkositas
});*/


app.get("/users", (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(404).json({ message: "Data not found" });
    }

    const salt = bcrypt.genSaltSync(7); //jelszo titkositas
    const hashedPassword = bcrypt.hashSync(password, salt);
    const saved = db.saveUser(email, hashedPassword);
    const user = getUserById(saved.lastInsertedRowid);
    res.status(201).json(user);
});

app.post("/login", (req, res) => { })



app.listen(PORT, () => {
    console.log(`Server runs on ${PORT}`)
})