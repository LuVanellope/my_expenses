# Give a visual summary about expenses for: day , last months, category and the accumulated compare the current month with the last one.

class DashboardHandler
  def today_expenses(expenses)
    @expenses = expenses
  end
  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end
end


