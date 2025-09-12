import express from "../user login db/node_modules/express";
import { dbAll, initializeDatabase, dbGet, dbRun } from "./util/database.js";

const port = 3000;
const app = express();
app.use(express.json());
app.use(cors());

app.post("/users", async (req, res) => {
  const { email, password} = req.body;

  if ((!email || !password)) {
    return res.status(400).json({ message: "Missing data!" });
  }

  try {
    const existing = await dbGet(
      "SELECT * FROM users WHERE email = ? AND password = ?",
      [email, password]
    );
    if (existing) {
      return res
        .status(409)
        .json({ message: "User already exists" });
    }

    const result = await dbRun(
      `INSERT INTO albums (email, password) VALUES (?, ?);`,
      [email, password]
    );
    res
      .status(201)
      .json({ id: result.lastID, email, password});
  } catch (err) {
    console.error("Error inserting user:", err);
    res
      .status(500)
      .json({ message: "Error inserting user", error: err.message });
  }
});