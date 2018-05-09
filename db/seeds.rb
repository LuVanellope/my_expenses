# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

200.times {|i| User.create(email:Faker::Internet.email, password:Faker::Internet.password)} Category.create([{ name: 'Restaurant' },{ name: 'Fun' }, { name: 'Education' }, { name:'Home responsabilities'}, { name: 'Others'} ] )
550.times {|i| User.create(email:Faker::Internet.email, password:Faker::Internet.password)}
TransactionType.create([ { name: 'Purchase' }, { name: 'Transaction' }, { name: 'payment' }, { name: 'withdraw'}])


200.times {|i| Expense.create( user: User.all.sample, category: Category.all.sample, transaction_type_id:TransactionType.all.sample.id, date: Faker::Date.between(6.months.ago, Date.today), amount: Faker::Number.number(10), concept: Faker::RickAndMorty.quote )} 
