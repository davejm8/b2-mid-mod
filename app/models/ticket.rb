class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def self.order_tickets
    order(age: :desc)
  end
end
