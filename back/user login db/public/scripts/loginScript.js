document.getElementById("form").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value.trim();
    const pwd = document.getElementById("pwd").value;
    const result = document.getElementById("result");

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    
    if (email === "") {
        result.textContent = "";
    }
    else if (!emailRegex.test(email)) {
        result.textContent = "Érvénytelen e-mail cím!";
        return;
    } else {
        result.textContent = "";
    }


    console.log("Email:", email);
    console.log("Password:", pwd);
});