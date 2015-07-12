require_dependency "keppler_ga_dashboard/application_controller"
require 'google/api_client'

module KepplerGaDashboard
  class DashboardController < ApplicationController
    def analytics
    	# set up a client instance
		  client  = ::Google::APIClient.new(:application_name => 'keppler', :application_version => '1')

		  #obtener archivo p.12 para autenticación
		  file_key = File.join(Rails.root, 'config', 'gaAuth', Rails.application.secrets.ga_auth.fetch(:file_key_name))

		  client.authorization = Signet::OAuth2::Client.new(
				:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
				:audience             => 'https://accounts.google.com/o/oauth2/token',
				:scope                => 'https://www.googleapis.com/auth/analytics.readonly',
				:issuer               => Rails.application.secrets.ga_auth.fetch(:service_account_email_address),
				:signing_key          => Google::APIClient::KeyUtils.load_from_pkcs12(file_key, 'notasecret')
		  ).tap { |auth| auth.fetch_access_token! }

		  @access_token =  client.authorization.fetch_access_token!["access_token"]
    end
  end
end
