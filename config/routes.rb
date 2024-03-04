Signum::Engine.routes.draw do
  post 'signal/show', to: 'signal#show'
  post 'signal/read', to: 'signal#read'
  post 'signal/close', to: 'signal#close'
  post 'signal/open_stickies', to: 'signal#open_stickies'
end
