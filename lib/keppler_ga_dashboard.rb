require "keppler_ga_dashboard/engine"

module KepplerGaDashboard
  ROUTE_SIDEBAR = true
  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
