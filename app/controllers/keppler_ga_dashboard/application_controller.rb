module KepplerGaDashboard
  class ApplicationController < ::ApplicationController
  	layout "admin/application"
  	before_filter :authenticate_user!
  	
  end
end
