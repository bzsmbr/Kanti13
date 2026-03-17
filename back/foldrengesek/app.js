import express from 'express'
import db from './data/db.js'

const PORT = 3000

const app = express();

app.use(express.json());

app.get('/rengesek/telepulesek/:varmegye', (req, res) => {
    const megye = req.params.varmegye;
    const telepulesek = [] 
    res.status(200).json(telepulesek)
})

app.get('/rengesek/varmegye/statisztika', (req, res) => {
    const stat = []
    res.status(200).json(stat)
})

app.get('/rengesek/intenzitas', (req, res) => {
    const rengesek = []
    res.status(200).json(rengesek)
})

app.post('/rengesek/uj', (req, res) => {
    const {datum, ido, telepules, varmegye, magnitudo, intenzitas} = req.body;

    if(!datum || !ido || !telepules || !varmegye || !magnitudo || !intenzitas)
    {
        return res.status(400).json({message: "Hiányzó adatok!"})
    }

    let telepId;

    const hely = db.prepare('SELECT * FROM telepules WHERE nev = ?').get(telepules)
    if(!hely) {
        const mentettHely = db.prepare('INSERT INTO telepules (nev, varmegye) VALUES (?, ?)').run(telepules, varmegye)
        const telepId = mentettHely.lastInsertRowid
    } else {
        telepId = hely.id
    }

    
    const mengtettRenges = db.prepare('INSERT INTO naplo (datum, ido, telepId, magnitudo, intenzitas) VALUES (?, ?, ?, ?, ?)').run(datum, ido, telepId, magnitudo, intenzitas)
    res.status(201).json({
        message: "Földrengés sikeresen rögzítve",
        id: mengtettRenges.lastInsertRowid
    })

})



app.listen(PORT, () => {
    console.log(`Server runs on http://localhost:${PORT}`)
})