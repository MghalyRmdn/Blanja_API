const mySQL = require("mysql");

const {HOST, DB, DB_USER, DB_PASSWORD} = process.env;


const db = mySQL.createConnection({
  // Setting DB
  host: HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB,
});

db.connect((err) => {
  if (err) throw err;
  console.log("Database Connected from mysql");
});

module.exports = db;
