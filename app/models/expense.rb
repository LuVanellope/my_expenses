class Expense < ApplicationRecord
  belongs_to :category  
  has_one :category
  validates :user_id, presence: true
  validates :amount, numericality: {greater_than: 0}
  validates :concept, presence: true 
  
  def date_cant_be_nil
    if self.date.nil?
      self.date = time.now
    end
  end
end
