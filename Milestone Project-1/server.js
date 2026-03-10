const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static("public"));

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "1234",
    database: "inventory_db"
});

db.connect(err => {
    if (err) throw err;
    console.log("MySQL Connected...");
});

// Add Product
app.post("/addProduct", (req, res) => {
    const { product_id, name,category, price, quantity } = req.body;
    const sql = "INSERT INTO products (product_id,product_name,category, price, quantity) VALUES (?, ?, ?, ?, ?)";
    db.query(sql, [product_id,name,category, price, quantity], (err, result) => {
        if (err) throw err;
        res.send("Product Added");
    });
});

// Get Products
app.get("/products", (req, res) => {
    db.query("SELECT * FROM products", (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});