# Desafio-API-2
# Construindo e Integrando uma API a banco de dados Mysql !




### 6 NECESSIDADES (constraints) para ser RESTful

- _client-server_: Separação do cliente e do armazenamento de dados (servidor), dessa forma, poderemos ter uma portabilidade do nosso sistema, usando o React para WEB e REact Native para o smartphone, por exemplo.

- _Stateless_: Cada requisição que o cliente faz para o servidor, deverá conter todas as informações necessárias para o servidor entender e responder (RESPONSE) a requisição (REQUEST). Exemplo: A sessão do usuário deverá ser enviada em todas as requisições, para saber se aquele usuário está autenticado e apto a usar os serviçoes, e o servidor não pode lembrar que o cliente foi autenticado na requisição anterior.

- _Cacheable_: As respostas para uma requisição, deverão ser explicitas ao dizer se aquela requisição, pode ou não ser cacheada pelo cliente.

- _Layered System_: O cliente acessa a um endpoint, sem precisar saber da complexidade, de quais passos estão sendo necessários para o servidor responder a requisição, ou quais outras camadas o servidor estará liando, para que a requisição seja respondida.

- _Code on demand (optional)_: Dá a possibilidade da nossa aplicação pegar códigos, como o Javascript, por exemplo, e executar no cliente;

## RESTFUL

RESTful, é a aplicação dos padrões REST.



## Dependências

- express 
- body-Parse
- mysql2

## Clonando o repositório


Abra seu CMD no diretório em que deseja salvar os arquivos e digite o comando:

```
clone https://github.com/vm-bertini/Desafio-em-grupo-API-.git
```

## Instalando as dependências

```
   npm install express 
   npm install --save body-parser
   npm isntall mysql2
```

## Configurando seu banco de dados:
Siga as etapas:
1. Encontre a pasta Database
2. Na pasta data base encontre o arquivo *Estrutura do banco de dados.sql* e *Inserção de dados originais.sql*
3. salve o path desses arquivos
4. No seu Mysql workbench pressione:
```
cntrl+ shift + O
```
5. Utilize do path copiado para acessar o diretório onde os arquivos *Estrutura do banco de dados.sql* e *Inserção de dados originais.sql* se encontram
6. Abra ambos No seu Work bench
7. execute o arquivo *Estrutura do banco de dados.sql* e ***DEPOIS***  a *Inserção de dados originais.sql*
8. Tudo pronto!

## Como Inicicar a conexão com o banco de dados 
Já feito o git clone, o setup da database e instalado as dependências necessárias basta seguir esse passos para iniciar sua conexão

1. Encontre a pasta Database novamente
2. Na pasta data base encontre o arquivo *database_connection.js*
3. Nesse arquivo vc encontrará o seguinte layout:
```
const mysql = require('mysql2')

var connection = mysql.createConnection({
    host: '',
    user: '',
    password: '',
    database: 'Banco_Desafio_API',
    multipleStatements: true
  })

module.exports = connection
  
```
4. preencha com os dados do seu banco de dados
5. Tudo Pronto!

## Executando a aplicação

   npm run start

## **Host e porta**

<localhost:3000>

## Layout do JSON
```
[
{
    "código": _Aqui vai o código do produto_,
    "descrição": "_Aqui vai a descrição do produto_",
    "preço":_Aqui vai o preço do produto_,
    "disponível": "_Aqui vai a disponibilidade do produto (sim ou não)_",
    "destaque": "_Aqui vai o destaque do produto (sim ou não)_",
    "quantidade em estoque": _Aqui vai a quantidade de estoque desse produto_,
    "Nome do departamento": "_Aqui vai o NOME do departamento ao qual o produto se associa_"
  }
  ]
```
### **Método GET**

Retorna a lista de todos os produtos existentes. Uma lista em formato JSON contendo todos os produtos da tabela.

### **URL**

localhost:3000/produtos`

### **Requisição**

`/produtos`


### **Método GET**

Retorna os detalhes de 1 único produto. Um único objeto JSON recuperado a partir do ID fornecido como componente da URL

### **URL**

localhost:3000/produtos/:id

### **Requisição**

`/produtos/:id`


### **Método POST**

Recebe um JSON com dados de um produto e o inclui na base de dados. Retorna para o usuário o Objeto que foi incluído na tabela

### **URL**

localhost:3000/produtos

### **Requisição**

`/produtos`


### **Método PUT**

Recebe um JSON com dados de um produto, cujo ID é especificado na URL e atualiza seus dados na base de dados.

### **URL**

localhost:3000/produto/{id}

### **Requisição**

`/produto/{id}`


### **Método GET**

Retorna a lista de todos os departamentos

### **URL**

localhost:3000/departamentos

### **Requisição**

`/departamentos`

### **Método GET**

Retorna o departamento e a lista de produtos que estão associadas a ele. Se o departamento não exisitir na base de Dados, retorna um status 404 - Not Found,

### **URL**

localhost:3000/departamentos/:id

### **Requisição**

`/departamentos/:id`
