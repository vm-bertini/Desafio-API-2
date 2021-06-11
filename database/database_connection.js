const mysql = require('mysql2')

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'vm_bertini@2002',
    database: 'Banco_Desafio_API',
    multipleStatements: true
  })

module.exports = connection
  