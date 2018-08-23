Rails.application.routes.draw do
  get '/:currency1/:currency2/:amount1', to: 'history#converter'
  get '/history/', to: 'history#history'
  get '/history/:limit', to: 'history#history'
  get '/list/', to: 'history#list'
end
