Rails.application.routes.draw do
    post '/parkings', to: 'parkings#create'
    get '/out/:id', to: 'parkings#out'
    get '/paymant/:id', to: 'parkings#paymant'
end
  