document.getElementById("form").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value.trim();

    const pwd1 = document.getElementById("pwd1").value;
    const pwd2 = document.getElementById("pwd2").value;

    const result = document.getElementById("result");

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        result.textContent = "";
    } else if (!emailRegex.test(email) && pwd1 !== pwd2) {
        result.innerHTML = "<p>Érvénytelen e-mail cím!<br>A két jelszó nem egyezik!</p>";
        return;
    } else if (!emailRegex.test(email)) {
        result.innerHTML = "<p>Érvénytelen e-mail cím!</p>";
        return;
    } else if (pwd1 !== pwd2) {
        result.innerHTML = "<p>A két jelszó nem egyezik!</p>";
        return;
    } else {
        insertUser(email, pwd1);
    }

    const db = require('./db');


});

function insertUser(email, password) {
    const sql = `INSERT INTO users (email, password) VALUES (?, ?)`;
    db.run(sql, [email, password], function (err) {
        if (err) {
        return console.error('Error inserting user:', err.message);
        }
        console.log(`User added with ID: ${this.lastID}`);
});
}