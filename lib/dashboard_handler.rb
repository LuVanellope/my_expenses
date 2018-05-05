# Give a visual summary about expenses for: day , last months, category and the accumulated compare the current month with the last one.

class DashboardHandler
 
 def initialize(expenses)
    @expenses = expenses
  end

  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
    @expenses.yesterday_expenses.pluck(:amount).sum
  end

  def this_month_expenses
    @expenses.this_month.pluck(:amount).sum
  end

  def last_month_expenses
    @expenes.last_month.pluck(:amount).sum
  end
  
  #Graficmethods  

  def last_six_months_expenses
  end

  def by_day_expenses
  end

  def by_category_expenses
  end

  def accumulated_last_vs_current_month 
  end

end


