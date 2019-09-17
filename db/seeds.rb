# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gym = Gym.create(name: 'Academia Paulista', cod: '001', address: 'Av. Paulista, 123', open_hour: '08:00', close_hour: '22:00', working_days: 'segunda à sexta')
another_gym = Gym.create(name: 'Academia Consolação', cod: '002', address: 'Av. Consolação, 123', open_hour: '08:00', close_hour: '22:00', working_days: 'segunda à sexta')
spare_gym = Gym.create(name: 'Academia Madalena', cod: '003', address: 'Av. Madalena, 123', open_hour: '08:00', close_hour: '22:00', working_days: 'segunda à sexta')

gym.gallery.attach(io: File.open(Rails.root.join('spec/support/academia_01.jpeg')), filename: 'academia_01.jpeg')
another_gym.gallery.attach(io: File.open(Rails.root.join('spec/support/academia_01.jpeg')), filename: 'academia_01.jpeg')
spare_gym.gallery.attach(io: File.open(Rails.root.join('spec/support/academia_01.jpeg')), filename: 'academia_01.jpeg')

Employee.create(name:'admin', status: 'active', gym:gym, email:'admin@espertofit.com.br', password: '123456', admin: true)
Employee.create(name:'funcionario', status: 'active', gym:gym, email:'funcionario@espertofit.com.br', password: '123456', admin: false)

plan = Plan.create(name: 'Premium', minimum_permanence: 60)


trainer = Trainer.create(name: 'Professor', cpf: 32467821, status: 0, email: 'professor@email.com')


Activity.create(name:'Zumba',price: 50.00, duration: 60, difficulty: 'Medio', equipments:'Nenhum', rules: 'Ser gentil', gym:gym,trainer:trainer, status: 0 )
Activity.create(name:'Zumba',price: 50.00, duration: 60, difficulty: 'Medio', equipments:'Nenhum', rules: 'Ser gentil', gym:gym,trainer:trainer, status: 9 )





Client.create(name: 'Bob', email: 'bob@email.com', cpf: '23445656778', gym_id: gym.id, plan_id: plan.id, status: 0)
Client.create(name: 'Bob', email: 'bob@email.com', cpf: '478564543', gym_id: gym.id, plan_id: plan.id, status: 9)
