Signum::Engine.routes.draw do
  post "signal/show", to: "signal#show"
  post "signal/close", to: "signal#close"
  post "signal/close_all", to: "signal#close_all"
  post "signal/open_stickies", to: "signal#open_stickies"
end
