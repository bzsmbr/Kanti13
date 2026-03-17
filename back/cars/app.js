//cars
//id,brand, model
import express from "express"

const PORT = 3000;
const app = express();

app.use(express.json());

app.get("/cars"), (req, res) => {
    const cars = db.getAllCars();
    res.status(200), json(cars);
}

app.get("/cars/:id"), (req, res) => {
    const cars = db.getCarsById(+req.params.id);
    if(!cars){
        return res.status(404).json({message: "Car not found!"});
    }
    res.status(200), json(cars);
}

app.post("/cars", (req, res) => {
    const {brand, model } = req.body;
    if(!brand || !model) {
        return res.status(400).json({message: "Invalid data!"})
    }
    const saved = db.saveCar(brand, model);
    const car = db.getCarsById(saved.lastInsertedRowId);
    res.status(201).json(car);
})

app.put("/cars/:id", (req, res) => {
    const id = req.params.id;
    let car = db.getCarsById(id);
    if(!car) {
        return res.status(400).json({message: "Car not found!"})
    }
    if(!brand || !model) {
        return res.status(400).json({message: "Invalid data!"})
    }
    db.updateCar(id, brand, model);
    car = db.getCarsById(id)
    res.status(200).json(car);
})

app.delete("/cars/:id", (req, res) => {
    db.delteCar(+req.params.id);
    res.status(200).json({message: "car deleted!"});
})

app.listen(PORT, () => {
    console.log(`Server runs on port ${PORT}`)
})