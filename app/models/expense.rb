class Expense < ApplicationRecord
  belongs_to :user
  has_one :category
  belongs_to :transactiontype

  validates :user_id, presence: true
  validates :category_id, presence: true 
  validates :amount, numericality: {greater_than: 0}
  validates :concept, presence: true 
  validate :date_cant_be_nil
  validate :transactiontype_id, presence: true



  def date_cant_be_nil
    if self.date.nil?
      self.date = time.now
    end
  end
end
