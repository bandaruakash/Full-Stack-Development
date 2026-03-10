function addProduct() {
    const name = document.getElementById("name").value;
    const category = document.getElementById("category").value;
    const price = document.getElementById("price").value;
    const quantity = document.getElementById("quantity").value;

    fetch("http://localhost:3000/addProduct", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, category, price, quantity })
    })
    .then(res => res.text())
    .then(data => {
        alert(data);
        loadProducts();
    });
}

function loadProducts() {
    fetch("http://localhost:3000/products")
    .then(res => res.json())
    .then(data => {
        let table = "";
        data.forEach(product => {
            table += `
                <tr>
                    <td>${product.product_id}</td>
                    <td>${product.product_name}</td>
                    <td>${product.category}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                </tr>
            `;
        });
        document.getElementById("productTable").innerHTML = table;
    });
}

loadProducts();