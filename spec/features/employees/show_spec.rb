require 'rails_helper'

# As a user,
# When I visit the employee show page,
# I do not see any tickets listed that are not assigned to the employee
# and I see a form to add a ticket to this department.
# When I fill in the form with the id of a ticket that already exists in the database
# and I click submit
# Then I am redirected back to that employees show page
# and I see the ticket's subject now listed.
# (you do not have to test for sad path, for example if the id does not match an existing ticket.)

RSpec.describe 'show view' do

  let!(:customer_service) { Department.create!(name: "Customer Service", floor: "Basement") }
  let!(:sales) { Department.create!(name: "Sales", floor: "Second") }
  let!(:steve) { sales.employees.create!(name: "Steve", level: 2) }
  let!(:bob) { customer_service.employees.create!(name: "Bob", level: 5) }
  let!(:ticket_1) { steve.tickets.create!(subject: "Toilet Big Dead", age: 1) }
  let!(:ticket_2) { steve.tickets.create!(subject: "Toilet Still Dead", age: 4) }
  let!(:ticket_3) { steve.tickets.create!(subject: "Bro, the toilet!", age: 3) }
  let!(:ticket_4) { bob.tickets.create!(subject: "Brain no worky", age: 3) }
  let!(:ticket_5) { bob.tickets.create!(subject: "US3", age: 3) }
  
  it 'displays department attributes' do
    visit "/employees/#{steve.id}"

    expect(page).to have_content("#{steve.name}")
    expect(page).to have_content("#{steve.department.name}")
    expect(ticket_2.subject).to appear_before(ticket_1.subject)
    expect(page).to have_content("#{ticket_2.subject}")
  end

  it 'has a form to add a ticket' do
    visit "/employees/#{steve.id}"
    
    
    fill_in "Find Ticket", with: ticket_5.id
    click_button "Add Ticket"
    

    expect(page).to have_content("#{ticket_5.subject}")
  end
end