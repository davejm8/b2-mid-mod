require 'rails_helper'

RSpec.describe 'index view' do

  let!(:customer_service) { Department.create!(name: "Customer Service", floor: "Basement") }
  let!(:sales) { Department.create!(name: "Sales", floor: "Second") }
  it 'displays department attributes' do
    visit '/departments'

    expect(page).to have_content("#{customer_service.name}")
    expect(page).to have_content("#{customer_service.floor}")
    expect(page).to have_content("#{sales.name}")
    expect(page).to have_content("#{sales.floor}")
  end
end