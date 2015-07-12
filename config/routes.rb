KepplerGaDashboard::Engine.routes.draw do
	scope :admin do
		 get 'dashboard', to: "dashboard#analytics"
	end
end
