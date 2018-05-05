class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type  

  validates :user_id, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :concept, presence: true
  before_create :date_cant_be_nil

  scope :for_category, -> (category) {joins(:category).where'categories.name = ?', category}

  scope :for_amount, -> (amount){ where('expenses.amount = ?', amount)} 

  scope :last_six_months, -> { where('date >= ?', 6.months.ago)}
  scope :this_month, -> {where('date > ? and date < ? ', Time.now.beginning_of_month, Time.now.end_of_month )}
  scope :last_month, -> {where('date > ?', 1.months.ago)} 
  
  scope :amount_last_month, -> {last_month.pluck(:amount).sum }
  scope :amount_this_month, -> {this_month.pluck(:amount).sum }

  scope :daily_expenses, -> {where('date >=?', 1.day.ago).count} 
  scope :yesterday_expenses, -> {where('date between ?and ?', 1.day.ago.beginning_of_day, 1.day.ago.end_of_the_day )}

  def date_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end
end
