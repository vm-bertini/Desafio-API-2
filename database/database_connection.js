const mysql = require('mysql2')

var connection = mysql.createConnection({
    host: '',
    user: '',
    password: '',
    database: 'Banco_Desafio_API'
  })

module.exports = connection
  