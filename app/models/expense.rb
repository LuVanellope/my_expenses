class Expense < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
end
