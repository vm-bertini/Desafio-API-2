const connection = require('../../Database/database_connection');

const Departamentos_query = require('../Sql Query/Departamentos_query')
const resposta_400 = require('../Respostas/400')

class departamentos_controller {
    async read (req,res) {
        //Condicional para quanto se quer apenas um departamento baseado em seu id
        if (req.params.id != undefined) 
            {connection.query(Departamentos_query.id + req.params.id, function (err, rows, fields) {

                if (err || rows.length == 0) 
                {return res.status(404).json(resposta_400.Not_Found)}
                
                return res.status(200).json(rows)
                })
            }
        //Condicional para quanto se quer todos os Departamentos
        else{
            {connection.query(Departamentos_query.todos, function (err, rows, fields) {

                if (err || rows.length == 0) 
                {return res.status(404).json(resposta_400.Not_Found)}

                return res.status(200).json(rows)

                })
            }   
        }
    };
}

module.exports = new departamentos_controller()