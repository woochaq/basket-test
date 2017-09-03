# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all

User.destroy_all
User.create(email: 'test@example.com', password: '123qweasd', password_confirmation: '123qweasd')

Product.destroy_all
Product.create(name: 'Smart Hub', price: 49.99)
Product.create(name: 'Motion Sensor', price: 24.99)
Product.create(name: 'Wireless Camera', price: 99.99)
Product.create(name: 'Smoke Sensor', price: 19.99)
Product.create(name: 'Water Leak Sensor', price: 14.99)

Promotion.destroy_all
Promotion.create(code: '20%OFF', discount: 20, connectable: false, kind: 'percent')
Promotion.create(code: '5%OFF', discount: 5, connectable: true, kind: 'percent')
Promotion.create(code: '20POUNDSOFF', discount: 20, connectable: true, kind: 'value')
