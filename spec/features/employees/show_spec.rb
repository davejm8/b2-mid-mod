require 'rails_helper'

# As a user,
# When I visit the Employee show page,
# I see the employee's name, department
# and a list of all of their tickets from oldest to youngest.
# I also see the oldest ticket assigned to the employee listed separately

RSpec.describe 'index view' do

  let!(:customer_service) { Department.create!(name: "Customer Service", floor: "Basement") }
  let!(:sales) { Department.create!(name: "Sales", floor: "Second") }
  let!(:steve) { sales.employees.create!(name: "Steve", level: 2) }
  let!(:bob) { customer_service.employees.create!(name: "Bob", level: 5) }
  let!(:ticket_1) { steve.tickets.create!(subject: "Toilet Big Dead", age: 5) }
  let!(:ticket_2) { steve.tickets.create!(subject: "Toilet Still Dead", age: 4) }
  let!(:ticket_3) { steve.tickets.create!(subject: "Bro, the toilet!", age: 3) }
  let!(:ticket_4) { bob.tickets.create!(subject: "Brain no worky", age: 3) }
  
  it 'displays department attributes' do
    visit "/employees/#{steve.id}"

    expect(page).to have_content("#{steve.name}")
    expect(page).to have_content("#{steve.department.name}")
    expect(steve.tickets.first.subject).to appear_before(steve.tickets.second.subject)
  end
end