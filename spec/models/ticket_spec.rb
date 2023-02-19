require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should belong_to :employee }
  end

  describe '::instance methods' do
  
    let!(:customer_service) { Department.create!(name: "Customer Service", floor: "Basement") }
    let!(:sales) { Department.create!(name: "Sales", floor: "Second") }
    let!(:steve) { sales.employees.create!(name: "Steve", level: 2) }
    let!(:bob) { customer_service.employees.create!(name: "Bob", level: 5) }
    let!(:ticket_1) { steve.tickets.create!(subject: "Toilet Big Dead", age: 5) }
    let!(:ticket_2) { steve.tickets.create!(subject: "Toilet Still Dead", age: 4) }
    let!(:ticket_3) { steve.tickets.create!(subject: "Bro, the toilet!", age: 3) }
    
    it 'orders tickets by age descending' do
      expect(steve.tickets.order_tickets).to eq([ticket_1, ticket_2, ticket_3])
    end
  end
end
