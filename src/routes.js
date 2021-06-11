//Criando a constante routes
const { Router } = require ('express')
const routes = new Router()
const connection = require('../Database/database_connection');
const produtos_controller = require('./controllers/produtos_controller');
const departamentos_controller = require('./controllers/departamentos_controller');
const resposta_400 = require('../Respostas/400');
const { Not_Found } = require('./Respostas/400');

//Criando conexão com o banco de dados
connection.connect()


// Get para retornar as informações de todos os produtos
routes.get ('/produtos', produtos_controller.read);
//Get para retornar as informações de um produto baseado em seu id
routes.get ('/produtos/:id', produtos_controller.read);
//Get para retornar as informações de todos os departamentos
routes.get ('/departamentos', departamentos_controller.read)
//Get para retornar as informações de de um departamento baseado em seu id
routes.get ('/departamentos/:id', departamentos_controller.read)
//Post para adicionar ao banco de dados um novo produto, retornando um 
//json do produto sendo adicionado
routes.post('/produtos', produtos_controller.create)
//Put alterando um produto já na base de dados especificado pelo seu ID, 
//recebendo um json com o novo produto
routes.put('/produtos/:id', produtos_controller.update);

//Um get para qualquer endpoint que não esteja definido
routes.get('*', (async(req,res)=>{
    return res.status(404).json(resposta_400.Not_Found)
}))

module.exports = routes