Signum::Engine.routes.draw do
  post 'signal/show', to: 'signal#show'
  post 'signal/close', to: 'signal#close'
end
