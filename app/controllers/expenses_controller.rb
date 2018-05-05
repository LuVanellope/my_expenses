class ExpensesController < ApplicationController
  def index
   transaction_type = params[:transaction_type]
   category = params[:category]
   @expenses = Expense.all 
   @amount = @expenses.pluck(:amount).sum
   if transaction_type
     #ENTRA TRANSACTION TYPE
     @expense = Expense.joins(:transactin_type, :category).where("transaction_types.name = ?",trasnsaction_type.capitalize)
    else
     @expense = Expense.last
    end

    @transaction_types = TransactionType.all
    respond_to do |format|
      format.html {render :index }
      format.json {render json: @expenses, status: :ok }
    end   
  end
end
