# Inova Crawler

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](LICENSE) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/)

Inova Crawler é um web crawler que captura frases do site http://quotes.toscrape.com.

- [Pré requisitos](#pré-requisitos)
- [Primeiros passos](#primeiros-passos)
- [Testes](#testes)
- [Documentação da Api](#documentação-da-api)
- [Licença](#licensa)

## Pré requisitos

As dependências deste projeto são:

- Rails 5.2
- Ruby 2.5
- MongoDB 4.0

## Primeiros passos

Siga as seguintes instruções para ter uma cópia deste projeto e conseguir executá-lo localmente.

Depois de copiar o repositório para sua máquina, acesse o diretório raiz do projeto e:

1. Inicie o MongoDB:  
 ``` sudo service mongod start ```

2. Crie um usuário de autenticação:  
 ```rails user:create ```  
 **obs:** após a execução, será exibido as informações de autenticação do sistema.
  
3. Inicie o server:  
 ```rails s```

## Testes  
Utilize as instruções a seguir para testar a aplicação
1. Executando os testes  
  ``` bundle exec rspec```

## Documentação da Api
### Introdução  
Através desta documentação você aprenderá como se autenticar e buscar frases de acordo com uma tag específica.

### Requisições
[Autenticação](#autenticação)  
[Frases](#frases)  
  
### Autenticação
Este sistema possui uma autenticão baseada em token.  
Utilize este endpoint para obter o token.

obs: o token gerado só é válido por 24 horas. 
 
- Url  
  `/authenticate `  
  
- Método  
  `POST`

- Body
```  
  {
    "email": "example@inovamind.com",
    "password": "111111"
  }
```  
Exemplo de Requisição cUrl
```
curl -H "Content-Type: application/json" -X POST -d '{"email":"example@inovamind.com","password":"111111"}' http://localhost:3000/authenticate
```
Tipos de Resposta:  
  
 - Sucesso - 200  
```
 {
      "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjp7IiRvaWQiOiI1YzYyZTBiMDFhMmM0ZTNjN2FiMTk2ZmUifSwiZXhwIjoxNTUwMDc4NzIzfQ.MNJ_hj3iDoNvTP4qvz0XjLoL9Np2HrzikpvneW6g_2M"
  }
```  
  
 - Inválido - 401
```
 {
      "error": {
          "user_authentication": [
              "invalid credentials"
          ]
      }
  }
```  

### Frases
#### Exibir frases 
Exibe frases relacionadas a uma tag específica
  
- Url  
  `/quotes/:search_tag/?pages=2&clean-cache=true`  
  
- Método  
  `GET`
  
- Headers  
  `Authorization` = [token_gerado_na_autenticação](#autenticação) 

- Url Parametros  
  Obrigatório:  
  `search_tag` - Tag que será buscada
  
  Opcional:  
  `pages` - quantidade de páginas em que será realizado a buscar
  
  `clean-cache` - Apaga o simulador de cache e realiza o scrap novamente  
    
  Exemplo de Requisição cUrl  
  ```  
  curl -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9.xsSwcPC22IR71OBv6bU_OGCSyfE89DvEzWfDU0iybMA" http://localhost:3000/quotes/love/?pages=2&clean-cache=true
  ```
  Tipos de Resposta:  
    
   - Sucesso - 200  
  
   ``` 
    {
        "quotes": [
          {
          "quote": "frase",
          "author": "nome do autor",
          "author_about": "link para o perfil do autor",
          "tags": ["tag1", "tag2"]
          }
        ]
    }
  ```  
  
   - Falha - 200  
  
   ``` 
    {
        "not_found": "Don't found quotes with teste tag"
    }
  ```  
  
## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes
