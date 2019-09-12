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

# Api Show Gym Details   
  
> GET "/api/v1/gyms/#{gym.id}"

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