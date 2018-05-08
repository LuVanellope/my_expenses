class ExpensesController < ApplicationController
  def index
    transaction_type = params[:transaction_type]
    category = params[:category]
    @expenses = Expense.all
    @amount = @expenses.sum(:amount)
    @transactions = @expenses.count
    if transaction_type
      #ENTRA TRANSACTION TYPE
      @expenses = Expense.joins(:transaction_type, :category).where("transaction_types.name = ?",transaction_type.capitalize)
    end

    if category
      @expenses = Expense.joins(:transaction_type, :category).where("category.name = ?",category.capitalize)
    end   
    @transaction_types = TransactionType.all
    @categories = Category.all
    #ACA NO EXISTE @categories.
    respond_to do |format|
      format.html {render :index }
       #CUANDO RESPONDES, @categories no está definido.
      format.json {render json: @expenses, status: :ok }
      format.js { render partial: "expenses", locals:{ expenses: @expenses } }
    end   
  end
end
