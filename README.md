# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# API's endpoints

  # API show all gyms

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

  # API show new clients

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

  # Api Show Gym Details   
  
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
<<<<<<< HEAD
    ```

  # Api Show Plans    

  ### Show all plans

    > GET api/v1/plans

    ```json

    # Exemplo de resposta para um ou mais planos

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

  
  ### Show search for one plans

    > GET "/api/v1/plans/#{plan.id}"

    ```json

    # Exemplo de resposta para um plano


    [ {"id":1,
      "name":"Premium",
      "minimum_permanence":60,
      "created_at":"2019-09-17T12:48:51.882Z",
      "updated_at":"2019-09-17T12:48:51.882Z"}
    ]

    # Exemplo de resposta para falha

    {"menssages":"Nenhum plano encontrado"}

    ```
      

=======
  ```

  # Api Show All Plans Prices   
  
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
>>>>>>> f95f97298a8edaf65d4db9ac6ab0e27af44cd13d
