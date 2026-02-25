// app.js
const express = require("express");
const cors = require("cors");
const db = require("./db");

const app = express();
app.use(express.json());
app.use(cors());

/*
========================================
1. GET /hosszu/:perc
========================================
*/
app.get("/hosszu/:perc", (req, res) => {
    const perc = Number(req.params.perc);

    if (isNaN(perc))
        return res.status(400).json({ message: "Érvénytelen paraméter." });

    const rows = db.prepare(`
        SELECT nev, tipus, ido
        FROM edzesek
        WHERE ido >= ?
    `).all(perc);

    res.json(rows);
});


/*
========================================
2. GET /vendeg?nev=
========================================
*/
app.get("/vendeg", (req, res) => {
    const { nev } = req.query;

    if (!nev)
        return res.status(400).json({ message: "Hiányzó név paraméter." });

    const rows = db.prepare(`
        SELECT tipus, ido, datum
        FROM edzesek
        WHERE nev = ?
    `).all(nev);

    res.json(rows);
});


/*
========================================
3. GET /aktiv/:darab
========================================
*/
app.get("/aktiv/:darab", (req, res) => {
    const darab = Number(req.params.darab);

    if (isNaN(darab))
        return res.status(400).json({ message: "Érvénytelen paraméter." });

    const rows = db.prepare(`
        SELECT nev, COUNT(*) AS edzesek_szama
        FROM edzesek
        GROUP BY nev
        HAVING COUNT(*) >= ?
    `).all(darab);

    res.json(rows);
});


/*
========================================
4. PUT /modosit
========================================
*/
app.put("/modosit", (req, res) => {
    const { azon, kaloria } = req.body;

    if (!azon || !kaloria)
        return res.status(400).json({ message: "Hiányzó adatok." });

    const edzes = db.prepare(`
        SELECT kaloria FROM edzesek WHERE azon = ?
    `).get(azon);

    if (!edzes)
        return res.status(404).json({ message: "Nincs ilyen edzés" });

    if (kaloria < edzes.kaloria)
        return res.status(400).json({ message: "Nem megfelelő kalóriaérték" });

    if (kaloria < 100)
        return res.status(400).json({ message: "Túl alacsony érték" });

    db.prepare(`
        UPDATE edzesek SET kaloria = ? WHERE azon = ?
    `).run(kaloria, azon);

    res.json({ message: "Sikeres módosítás" });
});


/*
========================================
5. POST /ujedzes
========================================
*/
app.post("/ujedzes", (req, res) => {
    const { nev, tipus, ido, kaloria, datum } = req.body;

    // 1. Kötelező mezők
    if (!nev || !tipus || !ido || !kaloria || !datum)
        return res.status(400).json({ message: "Hiányzó adatok." });

    // 2. Érvényes edzéstípus
    const tipusok = ["kardio", "ero", "joga", "crossfit"];
    if (!tipusok.includes(tipus))
        return res.status(400).json({ message: "Hibás edzéstípus." });

    // 3. Időtartam validálás
    if (ido < 20 || ido > 300)
        return res.status(400).json({ message: "Érvénytelen időtartam." });

    // 4. Kalória validálás
    if (kaloria < 100 || kaloria > ido * 20)
        return res.status(400).json({ message: "Nem megfelelő kalóriaérték." });

    // 5. Dátum ellenőrzés
    const today = new Date().toISOString().split("T")[0];
    if (datum > today)
        return res.status(400).json({ message: "A dátum nem lehet jövőbeli." });

    const result = db.prepare(`
        INSERT INTO edzesek (nev, tipus, ido, kaloria, datum)
        VALUES (?, ?, ?, ?, ?)
    `).run(nev, tipus, ido, kaloria, datum);

    res.status(201).json({
        message: "Edzés sikeresen rögzítve",
        id: result.lastInsertRowid
    });
});


/*
========================================
Szerver indítás
========================================
*/
app.listen(3000, () => {
    console.log("Szerver fut: http://localhost:3000");
});