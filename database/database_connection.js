const mysql = require('mysql2')

var connection = mysql.createConnection({
    host: '',
    user: '',
    password: '',
    database: ''
  })

module.exports = connection
  