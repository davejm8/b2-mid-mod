class Ticket < ApplicationRecord
  belongs_to :employee

  def self.order_tickets
    order(age: :desc)
  end
end
