pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2

pin "signum", to: "signum/application.js"

pin_all_from Signum::Engine.root.join("app/javascript/signum/controllers"), under: "signum/controllers", to: "signum/controllers"
pin_all_from Signum::Engine.root.join("app/components/signum"), under: "signum/components", to: "signum"
