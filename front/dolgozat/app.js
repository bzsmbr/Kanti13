import express from "express";
import * as db from "./data/db.js";

const PORT = 3000;
const app = express();

app.use(express.json());

app.get("/cars", (req, res) => {
    const cars = db.getAllCars();
    res.status(200), json(cars);
})

app.get("/cars/:id", (req, res) => {
    const cars = db.getCarbyid(+req.params.id);
    if(!cars) {
        return res.status(404).json({message: "Car not found!"});
    }
    res.status(200), json(cars);
})

app.post("/cars", (req, res) => {
    const {brand, model, year} = req.body;
    if(!brand || !model || !year) {
        return res.status(404).json({message: "Invalid data!"});
    }
    const saved = db.saveCar(brand, model, year);
    const car = db.getCarById(saved.lastInsertRowid);

    res.status(201), json(car);
})

app.put("/cars/:id", (req, res) => {
    const id = req.params.id;
    let car = db.getCarById(id);

    if(!car) {
        return res.status(404).json({message: "Car not found!"});
    }
    if(!brand || !model || !year) {
        return res.status(404).json({message: "Invalid data!"});
    }

    db.updateCar(id, brand, model, year);
    car = db.getCarById(id);

    res.status(200), json(car);
})

app.listen(PORT, () => {
    console.log(`Server runs on port ${PORT}`);
})