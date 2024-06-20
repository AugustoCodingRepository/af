// Esempio di array di byte (codificato Base64)
function convertArrayToIMG(array) {
    // Converti l'array di byte in una stringa Base64
    function byteArrayToBase64(byteArray) {
        let binary = '';
        let len = byteArray.byteLength;
        for (let i = 0; i < len; i++) {
            binary += String.fromCharCode(byteArray[i]);
        }
        return window.btoa(binary);
    }

    // Crea un oggetto Uint8Array dall'array di byte
    const byteArray = new Uint8Array(array);

    // Converti l'array di byte in una stringa Base64
    const base64String = byteArrayToBase64(byteArray);

    // Costruisci l'URL dell'immagine codificata in Base64
    const imageSrc = `data:image/png;base64,${base64String}`; // Assicurati che 'image/png' sia il tipo MIME corretto

    // Imposta l'attributo src dell'elemento <img> con ID 'imgProduct'
    document.getElementById('imgProduct').src = imageSrc;
}
