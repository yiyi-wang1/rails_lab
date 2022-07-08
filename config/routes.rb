Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products

  get('/home' => "welcome#home")
  get('/about',{to: "welcome#about"})
  get('/contact_us' => "welcome#contact_us")
  get('/thank_you' => "welcome#thank_you")

  get('/new_bill' => "bills#new_bill")
  post('/split_bill' => "bills#split_bill")
end
