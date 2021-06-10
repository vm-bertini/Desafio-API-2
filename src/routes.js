//Criando a constante routes
const { Router } = require ('express')
const routes = new Router()
const connection = require('../Database/database_connection');
const produtos_controller = require('./controllers/produtos_controller');

//Criando conexão com o banco de dados
connection.connect()


// Get para retornar as informações de todos os produtos
routes.get ('/produtos', produtos_controller.read);
//Get para retornar as informações de um produto baseado em seu id
routes.get ('/produtos/:id', produtos_controller.read);
//Get para retornar as informações de todos os departamentos
routes.get ('/departamentos', async(req, res) =>{
    return res.status(200).json(departamentos)
})
//Get para retornar as informações de de um departamento baseado em seu id
routes.get ('/departamentos/:id', async(req,res)=>{
    const { id } = req.params
    for (let departamento of departamentos){
        if (departamento.id == id){
            return res.json([departamento])
        }
    }
    const response = {
        status: 404,
        mensagem: 'Not-Found'
    }
    return res.status(404).json(response)
})
//Post para adicionar ao banco de dados um novo produto, retornando um 
//json do produto sendo adicionado
routes.post('/produtos', async(req,res)=>{
    const resposta = req.body
    for (let i of resposta){
        if (i.id == 0 || i.descricao === undefined|| i.preco === 0|| i.estoque === undefined|| i.disponivel != true && i.disponivel != false|| i.destaque != true && i.destaque != false || i.departamento_id == 0 )
        {
        return res.status(400)
        }
    }
    produtos = produtos.concat(resposta);
    return res.status(202).json(resposta)
})
//Put alterando um produto já na base de dados especificado pelo seu ID, 
//recebendo um json com o novo produto
routes.put('/produtos/:id', async(req,res)=>{
    const resposta = req.body
    const { id } = req.params
    for (let i of resposta){
        if (i.id == 0 || i.descricao === undefined|| i.preco === 0|| i.estoque === undefined|| i.disponivel != true && i.disponivel != false|| i.destaque != true && i.destaque != false || i.departamento_id == 0 )
        {
            const response = {
                status: 400,
                mensagem: 'Bad-Request'
            }
            return res.status(400).json(response)
        }
    }
    for (let produto of produtos){
        if (produto.id == id){
            produto.id = resposta[0].id
            produto.estoque = resposta[0].estoque
            produto.disponivel = resposta[0].disponivel
            produto.destaque = resposta[0].destaque
            produto.departamento_id = resposta[0].departamento_id
            return res.status(202).json(produtos)
        }
        
}
const response = {
    status: 404,
    mensagem: 'Not-Found'
}
return res.status(404).json(response)});

//Um get para qualquer endpoint que não esteja definido
routes.get('*', (async(req,res)=>{
    return res.status(404)
}))

module.exports = routes