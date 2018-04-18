FactoryBot.define do
factory :expense do
  concept Faker::Pokemon.name
  amount 25000
  association :category, factory: category
  association :user, factory: :user
  association :transaction_type, factory: :transaction_type
  end
end

