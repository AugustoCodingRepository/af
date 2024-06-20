console.log("scriptInput.js caricato");

function enableInputs() {
    console.log("Abilitazione input");
    document.querySelectorAll('.input-group input').forEach(input => {
        input.disabled = false;
    });
}
