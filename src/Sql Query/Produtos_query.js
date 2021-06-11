const connection = require("../../Database/database_connection")


module.exports = {
    id:'SELECT produtos.ID, produtos.código, produtos.descrição, produtos.preço, produtos.disponível, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` FROM produtos '+
            'inner join estoques on produtos.estoque_id= estoques.id inner join departamentos on produtos.departamento_id = departamentos.id Where produtos.id =',
    todos:'SELECT produtos.ID, produtos.código, produtos.descrição, produtos.preço, produtos.disponível, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` FROM produtos '+
    'inner join estoques on produtos.estoque_id= estoques.id inner join departamentos on produtos.departamento_id = departamentos.id',
    post: 
        "SET @código= ?; SET @descrição= ?; SET @preço= ?; SET @disponível= ?; SET @destaque= ?; SET @qtd_estoque= ?; SET @Nome_depto = ?; \
        CALL`novo produto`(@código,@descrição,@preço,@disponível,@destaque,@qtd_estoque,@Nome_depto)",
    put: "SET @id = ?; SET @código= ?; SET @descrição= ?; SET @preço= ?; SET @disponível= ?; SET @destaque= ?; SET @qtd_estoque= ?; SET @Nome_depto = ?; \
    CALL`alteração de produto`(@id,@código,@descrição,@preço,@disponível,@destaque,@qtd_estoque,@Nome_depto)"
}
