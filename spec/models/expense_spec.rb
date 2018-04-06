require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'the expense exists' do
    it 'should belong to user' do
      time = Time.now.freeze
      expense = Expense.new(amount: 30000, concept: 'uber', date: time )
      expect(expense.save)to eq(true) 
    end
  end
end
