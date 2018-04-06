require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'the expense exists' do
    it 'should belong to user' do
      time = Time.now.freeze
      user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
      puts user.inspect
      expense = Expense.new(amount: 30000, concept: 'uber', date: time, user_id: user.id)
      expect(expense.valid?).to eq(true) 

    end
  end
end
