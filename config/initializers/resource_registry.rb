CovidRegistry = ResourceRegistry::Registry.new

CovidRegistry.configure do |config|
  config.name       = :covid_most
  config.created_at = DateTime.now
  config.load_path  = Rails.root.join('system', 'config', 'features').to_s
end