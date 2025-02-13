Rails.application.routes.draw do

  get '/departments', to: 'departments#index'

  get '/employees/:id', to: 'employees#show'
  post '/employee_tickets/:id', to: 'employee_tickets#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
