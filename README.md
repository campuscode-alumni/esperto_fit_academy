# README

Aplicação em rails de gerenciamento de uma rede de academias.
Feita em grupo para o curso Treinadev da Campus Code

* Ruby version 2.6.4

## Conteúdo
- [Endpoints API](#API's_endpoints)
- [Equipe](#Equipe)
- [Considerações](#API_show_gym_details )



## Endpoints API

- [Mostrar todas as academias](#API_show_all_gyms)
- [Cadastrar novos clientes](#API_show_new_clients)
- [Mostrar detalhes de uma unidade](#API_show_gym_details )
- [Mostrar preços de planos](#API_show_all_plans_prices)
- [Mostrar aulas avulsas](#API_show_all_activities )
- [Consulta de CPF](#API_consult_cpf )

# API's_endpoints

  ## API_show_all_gyms

    > GET "/api/v1/gyms"

  ```json
    # Exemplo de resposta
    {
      "gym":{
        "id":1,
        "created_at":"2019-09-12T17:13:13.272Z",
        "updated_at":"2019-09-12T17:13:13.275Z",
        "name":"Academia 01",
        "cod":1,
        "open_hour":"09:00",
        "close_hour":"22:00",
        "working_days":"segunda à sexta",
        "address":"Av Paulista 111",
      }
    }
  ```

  ## API_show_new_clients

    > POST "/api/v1/clients"

  ```json
  # Exemplo de entrada
    {
      "id":1,
      "name":"Mario",
      "email":"teste@espertofit.com.br",
      "status":"active",
      "gym_id":"gym.id",
      "plan_id":"plan.id",
      "cpf":"123"
    }
  ```

  ## API_show_gym_details   
  
    > GET "/api/v1/gyms/#{gym.id}" (Foram criadas 3 academias no banco de dados)

  ```json
    # Exemplo de resposta
    {
      "gym":{
        "id":1,
        "created_at":"2019-09-12T17:13:13.272Z",
        "updated_at":"2019-09-12T17:13:13.275Z",
        "name":"Academia 01",
        "cod":1,
        "open_hour":"09:00",
        "close_hour":"22:00",
        "working_days":"segunda à sexta",
        "address":"Av Paulista 111",
        "images":["http://www.example.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f38dc1ef0ace3dbcd4f962ceffdf6ffa578a23f1/academia_01.jpeg"]
      }
    }
  ```

  ## API_show_all_plans_prices   
  
    > GET "/api/v1/gyms/#{gym.id}/plans"

  ```json
    # Exemplo de resposta
    {
      "plans":[{
          "id":1,
          "name":"Premium",
          "minimum_permanence":3,
          "created_at":"2019-09-17T18:28:35.445Z",
          "updated_at":"2019-09-17T18:28:35.445Z",
          "price":100000
      },
       {
          "id":2,
          "name":"Basic",
          "minimum_permanence":3,
          "created_at":"2019-09-17T18:28:35.447Z",
          "updated_at":"2019-09-17T18:28:35.447Z",
          "price":500000
        }]
    }
  ```

  ## API_show_all_activities  
  
    > GET "/api/v1/gyms/#{gym.id}/activities"

  ```json
    # Exemplo de resposta
      [{
        "id":1,
        "name":"Zumba",
        "status": "active",
        "price": 45.35,
        "duration": 40,
        "capacity": 45,
        "difficulty": "fácil",
        "equipaments": "Nenhum",
        "rules": "Respeitar todos os membros",
        "gym_id": 1,
        "trainer_id": 1,
        "created_at":"2019-09-17T18:28:35.445Z",
        "updated_at":"2019-09-17T18:28:35.445Z",
      },
       {
        "id":1,
        "name":"Yoga",
        "status": "active",
        "price": 45.35,
        "duration": 40,
        "capacity": 45,
        "difficulty": "fácil",
        "equipaments": "Nenhum",
        "rules": "Respeitar todos os membros",
        "gym_id": 1,
        "trainer_id": 1,
        "created_at":"2019-09-17T18:28:35.445Z",
        "updated_at":"2019-09-17T18:28:35.445Z",
        }]  
  ```

  ## API_consult_cpf

    > GET "/api/v1/clients/consult_cpf/#{client.cpf}"

   ```json
  # Exemplo de resposta
    {
      "status":"banished",
      "cpf":"12312312300",
    }
  ```



## Equipe

A equipe foi composta por @kendyhiga @adubas @CiroDVolpe @kaformentini @trgarcia @Vinicius-CP

## Considerações 