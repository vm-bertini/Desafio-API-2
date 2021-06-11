const connection = require('../../Database/database_connection');

const Produtos_query = require('../Sql Query/Produtos_query')
const resposta_400 = require('../Respostas/400')

class produtos_controller {
    async read (req,res) {
        //Condicional para quanto se quer apenas um produto baseado em seu id
        if (req.params.id != undefined){ 
            connection.query(Produtos_query.id + req.params.id, function (err, rows, fields) {

                if (err || rows.length == 0) 
                {return res.status(404).json(resposta_400.Not_Found)}
                
                return res.status(200).json(rows)
            })
        }
        //Condicional para quanto se quer todos os produtos
        else{
            connection.query(Produtos_query.todos, function (err, rows, fields) {

                if (err || rows.length == 0){ 
                return res.status(404).json(resposta_400.Not_Found)
                }

                return res.status(200).json(rows)

            })  
        }
    };
    async create(req,res){
        let emp = req.body[0]
        connection.query(Produtos_query.post, [emp.código, emp.descrição, emp.preço,emp.disponível, emp.destaque, emp[`quantidade em estoque`], emp[`Nome do departamento`]], function (err, rows, fields) {
            if (err || rows.length == 0){ 
            return res.status(400).json(resposta_400.Bad_Request)
            }

            return res.status(200).json(rows[7])
        })
    };
    async update(req, res){
        let emp = req.body[0]
        connection.query(Produtos_query.put, [req.params.id, emp.código, emp.descrição, emp.preço,emp.disponível, emp.destaque, emp[`quantidade em estoque`], emp[`Nome do departamento`]], function(err, rows, fields){
            if (err || rows.length == 0){ 
                return res.status(400).json(resposta_400.Bad_Request)
                }
            return res.status(200).json(rows[8]) 
        })
    }
}

module.exports = new produtos_controller()