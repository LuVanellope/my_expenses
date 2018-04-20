class UserMailer < ApplicationMailer
  def register_new_expense(user)
    @user = user
    @expense = user.expenses.last
    mail(to: @user.email, subject: "You register a new expense is #{@expense}" ) 
  end
end
