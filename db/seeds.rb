# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gym = Gym.create()
Employee.create(name:'admin', status: 'active', gym:gym, email:'admin2@espertofit.com.br', password: '123456', admin: true)
Employee.create(name:'funcionario', status: 'active', gym:gym, email:'funcionario@espertofit.com.br', password: '123456', admin: false)