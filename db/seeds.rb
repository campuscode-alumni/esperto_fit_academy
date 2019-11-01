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

Employee.create(name:'Admin', status: 'active', gym_id: gym.id, email:'admin@espertofit.com.br', password: '123456', admin: true)
Employee.create(name:'Funcionario', status: 'active', gym_id: gym.id, email:'funcionario@espertofit.com.br', password: '123456', admin: false)
Employee.create(name:'Jose da Silva', status: 'active', gym_id: another_gym.id, email:'jose.silva@espertofit.com.br', password: '123456', admin: false)
Employee.create(name:'Fulano de Tal', status: 'unactive', gym_id: gym.id, email:'fulano.tal@espertofit.com.br', password: '123456', admin: false)
Employee.create(name:'Maria de Souza', status: 'unactive', gym_id: spare_gym.id, email:'maria.souza@espertofit.com.br', password: '123456', admin: false)

premium_plan = Plan.create(name: 'Premium', minimum_permanence: 60)
basic_plan = Plan.create(name: 'Basic', minimum_permanence: 90)
vip_plan = Plan.create(name: 'VIP', minimum_permanence: 120)

Price.create(value: 12999, gym_id: gym.id, plan: premium_plan)
Price.create(value: 7999, gym_id: gym.id, plan: basic_plan)
Price.create(value: 19999, gym_id: gym.id, plan: vip_plan)

Price.create(value: 12999, gym_id: another_gym.id, plan: premium_plan)
Price.create(value: 7999, gym_id: another_gym.id, plan: basic_plan)
Price.create(value: 19999, gym_id: another_gym.id, plan: vip_plan)

Price.create(value: 12999, gym_id: spare_gym.id, plan: premium_plan)
Price.create(value: 7999, gym_id: spare_gym.id, plan: basic_plan)
Price.create(value: 19999, gym_id: spare_gym.id, plan: vip_plan)

trainer = Trainer.create(name: 'Caio Rodrigues', cpf: 456, status: 0, email: 'professor@email.com')
other_trainer = Trainer.create(name: 'Rebecca Garcia', cpf: 222, status: 0, email: 'rebecca.garcia@email.com')
another_trainer = Trainer.create(name: 'Rodrigo Menezes', cpf: 126, status: 10, email: 'johnny.souza@email.com')
Trainer.create(name: 'Carla Ferrari', cpf: 125, status: 10, email: 'carla.ferrari@email.com')
Trainer.create(name: 'Lucas Skywalker', cpf: 1234, status: 0, email: 'lucas.skywalker@email.com')


Activity.create(name:'Zumba',price: 50.00, duration: 45, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id:gym.id, trainer_id:trainer.id, status: 0, capacity:50)
Activity.create(name:'Yoga',price: 90.00, duration: 50, difficulty: 'Médio', equipments: 'Tapete', rules: 'Seguir cuidadosamente as instruções', gym_id:gym.id, trainer_id:trainer.id, status: 9 , capacity:50)
Activity.create(name:'Pilates',price: 80.00, duration: 45, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir corretamente as instruções do instrutor', gym_id:gym.id, trainer_id:trainer.id, status: 9 , capacity:50)
Activity.create(name:'Boxe',price: 50.00, duration: 40, difficulty: 'Difícil', equipments: 'Luvas', rules: 'Ter condicionamento físico adequado para a atividade', gym_id:gym.id, trainer_id:trainer.id, status: 9 , capacity:50)
Activity.create(name:'HIIT',price: 60.00, duration: 60, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id:gym.id, trainer_id:trainer.id, status: 9 , capacity:50)
Activity.create(name:'Spinning',price: 75.00, duration: 60, difficulty: 'Fácil', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id:gym.id, trainer_id:trainer.id, status: 9 , capacity:50)

Activity.create(name:'Yoga',price: 90.00, duration: 50, difficulty: 'Médio', equipments: 'Tapete', rules: 'Seguir cuidadosamente as instruções', gym_id: another_gym.id, trainer_id: other_trainer.id, status: 9 , capacity:50)
Activity.create(name:'Pilates',price: 80.00, duration: 45, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir corretamente as instruções do instrutor', gym_id: another_gym.id, trainer_id: other_trainer.id, status: 9 , capacity:50)
Activity.create(name:'Boxe',price: 50.00, duration: 40, difficulty: 'Difícil', equipments: 'Luvas', rules: 'Ter condicionamento físico adequado para a atividade', gym_id: another_gym.id, trainer_id: other_trainer.id, status: 9 , capacity:50)
Activity.create(name:'HIIT',price: 60.00, duration: 60, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id: another_gym.id, trainer_id: other_trainer.id, status: 9 , capacity:50)

Activity.create(name:'Pilates',price: 80.00, duration: 45, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir corretamente as instruções do instrutor', gym_id: spare_gym.id, trainer_id: another_trainer.id, status: 9 , capacity:50)
Activity.create(name:'Boxe',price: 50.00, duration: 40, difficulty: 'Difícil', equipments: 'Luvas', rules: 'Ter condicionamento físico adequado para a atividade', gym_id: spare_gym.id, trainer_id: another_trainer.id, status: 9 , capacity:50)
Activity.create(name:'HIIT',price: 60.00, duration: 60, difficulty: 'Médio', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id: spare_gym.id, trainer_id: another_trainer.id, status: 9 , capacity:50)
Activity.create(name:'Spinning',price: 75.00, duration: 60, difficulty: 'Fácil', equipments: 'Nenhum', rules: 'Seguir cuidadosamente as instruções', gym_id: spare_gym.id, trainer_id: another_trainer.id, status: 9 , capacity:50)

Client.create(name: 'John Doe', email: 'john.doe@email.com', cpf: '23445656778', gym_id: gym.id, plan_id: premium_plan.id, status: 0)
Client.create(name: 'Heitor da Cruz', email: 'heitor.cruz@email.com', cpf: '478564543', gym_id: gym.id, plan_id: basic_plan.id, status: 1)
Client.create(name: 'Karen de Azevedo', email: 'karen.azevedo@email.com', cpf: '14692289805', gym_id: gym.id, plan_id: vip_plan.id, status: 6)
Client.create(name: 'Lúcia Alcântara', email: 'lucia.alcantara@email.com', cpf: '53646312815', gym_id: gym.id, plan_id: basic_plan.id, status: 0)
Client.create(name: 'Roberto Pereira', email: 'roberto.pereira@email.com', cpf: '12345678900', gym_id: gym.id, plan_id: premium_plan.id, status: 0)


