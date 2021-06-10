module.exports = {
    id:'SELECT produtos.ID, produtos.código, produtos.descrição, produtos.preço, produtos.disponível, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` FROM produtos '+
            'inner join estoques on produtos.estoque_id= estoques.id inner join departamentos on produtos.departamento_id = departamentos.id Where produtos.id =',
    todos:'SELECT produtos.ID, produtos.código, produtos.descrição, produtos.preço, produtos.disponível, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` FROM produtos '+
    'inner join estoques on produtos.estoque_id= estoques.id inner join departamentos on produtos.departamento_id = departamentos.id'
}