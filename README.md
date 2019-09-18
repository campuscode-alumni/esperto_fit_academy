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
- [Mostrar detalhes de uma unidade](#API_show_gym_details)
- [Mostrar preços de planos](#API_show_all_plans_prices)
- [Mostrar aulas avulsas](#API_show_all_activities)
- [Consulta de CPF](#API_consult_cpf)
- [Mostrar todos os planos](#API_show_plans)
- [Mostrar detalhes de um plano](#API_show_one_plan)
- [Mostrar dados de matricula](#API_send_registration_data)
- [Desmatricular clientes](#API_recive_unregistration_from_client_site)

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

    #Exemplo de resposta para falha

    {"messages": "Nenhuma unidade cadastrada"}
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

  #Exemplo de resposta para falha

    {"messages": "Não foi possivel cadastrar esse aluno"}    
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

    #Exemplo de resposta para falha

    {"messages": "Academia não encontrada"}
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

    #Exemplo de resposta para falha

    {"messages": "Nenhum plano cadastrado"}
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
        
    #Exemplo de resposta para falha

    {"messages": "Nenhuma classe cadastrada"}
  ```

  ## API_consult_cpf

    > GET "/api/v1/clients/consult_cpf/#{client.cpf}"

   ```json
    # Exemplo de resposta
      {
        "status":"banished",
        "cpf":"12312312300",
      }

    #Exemplo de resposta para falha

    {"messages": "CPF não encontrado"}
  ```
  ## API_show_plans

    > GET "/api/v1/show_all_plans" 

  ```json
    # Exemplo de resposta
    [ {"id":1,
      "name":"Premium",
      "minimum_permanence":60,
      "created_at":"2019-09-17T12:48:51.882Z",
      "updated_at":"2019-09-17T12:48:51.882Z"},
      { "id":2,
      "name":"Básico",
      "minimum_permanence":3,
      "created_at":"2019-09-17T12:55:00.722Z",
      "updated_at":"2019-09-17T14:33:24.232Z"}
    ]
    
    
    # Exemplo de resposta para falha

    {"menssages":"Nenhum plano encontrado"}
  ```

  ## API_show_one_plan

    > GET "/api/v1/plans/#{plan.id}"

  ```json
    # Exemplo de resposta
    [ {"id":1,
      "name":"Premium",
      "minimum_permanence":60,
      "created_at":"2019-09-17T12:48:51.882Z",
      "updated_at":"2019-09-17T12:48:51.882Z"}
    ]

    # Exemplo de resposta para falha
    
    {"menssages":"Nenhum plano encontrado"}
  ```
   
  ##API_send_registration_data
  
    > GET "/api/v1/clients/#{client.cpf}"

  ```json
    # Exemplo de resposta
    {
      "id":1,
      "name":"Mario",
      "email":"teste@espertofit.com.br",
      "status":"active",
      "gym_id":"gym.id",
      "plan_id":"plan.id",
      "cpf":"123"
    }

    # Exemplo de resposta para falha
    
    "Cliente não encontrado"
  ```
  ##API_recive_unregistration_from_client_site
  
    >POST "/api/v1/inactivate_client/#{client.cpf}"
    
    ``json
    # Exemplo de resposta
    {
      "Cliente desmatriculado com sucesso"
    }

    # Exemplo de resposta para falha
    
    "CPF não encontrado"
  ```

## Equipe

A equipe foi composta por @kendyhiga @adubas @CiroDVolpe @kaformentini @trgarcia @Vinicius-CP

## Considerações 
