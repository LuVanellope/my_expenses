require 'rails_helper'
require './lib/dashboard_handler'

RSpec.describe DashboardHandler do
  before do
    new_expense_1 = FactoryBot.create(:expense, user: @user,  date:time)
    new_expense_2 = FactoryBot.create(:expense, user: @user, concept: 'this is something', date: time )
    new_expense_3 = FactoryBot.create(:expense, user: @user,  amount: 40000,  date: time )
    new_expense_4 = FactoryBot.create(:expense, user: @user,  amount: 40000,  date: time - 2.days.ago)
    new_expense_5 = FactoryBot.create(:expense, user: @user,  amount: 40000,  date: time - 2.days.ago)
  end

  describe '.today_expenses' do
   it 'should calculate today expenses' do
     pust @user.expenses.daily_expenses.count
     puts '#'* 10
     puts @user.expenses.daily_expenses.inspect
     new_handler = described_class.new(@user.expenses)
     expect(new_handler.today_expenses).to eq(90000)
   end
  end
end
