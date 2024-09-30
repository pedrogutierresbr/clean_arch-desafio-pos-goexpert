# Clean Architecture

  

## Sobre o projeto

  

Este é o repositório destinado ao desafio Clean Architecture do curso Pós Goexpert da faculdade FullCycle.

  

## Funcionalidades

  

- O projeto possibilita ao usuário:

  
- Criar ordens e salvá-las no banco de dados;
- Listar todas as ordens criadas;

  

## Como executar o projeto

  

### Pré-requisitos

  

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:

  

- [Git](https://git-scm.com)

- [VSCode](https://code.visualstudio.com/)

- [Rest Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

 - [Migrate](https://github.com/golang-migrate/migrate) 

-  [Evans](https://github.com/ktr0731/evans) 

#### Acessando o repositório

  

```bash

# Clone este repositório

$ git clone https://github.com/pedrogutierresbr/clean_arch-desafio-pos-goexpert.git

```

  

#### Rodando a aplicação

  

```bash

# Abrir um terminal

# 1 - Importar os pacotes

$ go mod tidy

# 2 - Subir banco de dados (docker)

$ docker-compose up -d

# 3 - Configurar banco de dados

$ make migrate

# 4 - Abrir outro terminal e navegar até a pasta com arquivo main.go

$ cd cmd/ordersystem/

# 5 - Rodar aplicação

$ go run main.go wire_gen.go

```

  

#### Fazendo as requisição

Serviços estarão disponíveis nas seguintes portas:

- Web Server : 8000

- gRPC: 50051

- GraphQL: 8080
  
##### Web Server
```bash
# Abra a pasta API


# Para criar uma order abra o arquivo create_order.http

# Preencha os dados de id, price, tax

# Clique em Send Request*


# Para listar as ordens salvas abra o arquivo list_order.http

# Clique em Send Request*

```

##### gRPC
```bash

# Abra um terminal

# Na raiz do projeto

$ evans -r repl

# Caso package e service não tenham sido selecionados

$ package pb

$ service OrderService


# Para criar uma ordem

$ call CreateOrder 

$ id (TYPE_STRING) => <digite um valor>
$ price (TYPE_FLOAT) => <digite um valor> 
$ tax (TYPE_FLOAT) => <digite um valor>


# Para listar as ordens salvas no banco de dados

$ call ListOrders

```

##### GraphQL
```bash

# Abra uma aba de seu navegor em

$ http://localhost:8080


# Para criar uma ordem (substitua os valores)
mutation createOrder{
    createOrder(input: {id: "xxxxxxx", Price: xxx.xx, Tax: x.x}) {
        id
        Price
        Tax
        FinalPrice
    }
}


# Para listar as ordens salvas no banco de dados
query listOrders {
    listOrders {
        id
        Price
        Tax
        FinalPrice
    }
}

```


## Licença

  

Este projeto esta sobe a licença [MIT](./LICENSE).

  

Feito por Pedro Gutierres [Entre em contato!](https://www.linkedin.com/in/pedrogabrielgutierres/)