function filter() {
    var category = document.getElementById("categories").value;
    var minPrice = document.getElementById("minPrice").value;
    var maxPrice = document.getElementById("maxPrice").value;
    var sort = document.getElementById("sort").value;

    if (minPrice > maxPrice) {
        var temp = minPrice;
        minPrice = maxPrice;
        maxPrice = temp;
    }
    if (minPrice == "") {
        minPrice = 0;
    }
    if (maxPrice == "") {
        maxPrice = 999999999;
    }
    if (sort == "") {
        sort = "AZ";
    }
    if (category == "") {
        category = "all";  // Utilizziamo 'all' come valore predefinito per la categoria
    }

    console.log(`Category: ${category}, Min Price: ${minPrice}, Max Price: ${maxPrice}, Sort: ${sort}`);

    const xhr = new XMLHttpRequest();
    xhr.open("GET", `./FilterServlet?category=${category}&minPrice=${minPrice}&maxPrice=${maxPrice}&sort=${sort}`, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var productItemsElement = document.getElementById("products");
            if (productItemsElement) {
                productItemsElement.innerHTML = xhr.responseText;
            } else {
                console.error("Elemento non trovato nel DOM.");
            }
        }
    };
    xhr.send();
}
