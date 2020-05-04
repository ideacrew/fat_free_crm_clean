# Initializer file created by Resource Registry
app_name = Rails.application.class.parent_name
registry_name = "#{app_name}Registry"
Object.const_set(registry_name, ResourceRegistry::Registry.new)

registry = registry_name.constantize
app_key  = app_name.underscore.to_sym

registry.configure do |config|
  config.name       = app_key
  config.created_at = DateTime.now
  config.load_path  = Rails.root.join('system', 'config', 'features').to_s
end

# Environment variables listed here will be imported as settings on the application feature
env_vars = %w(
	AWS_ACCESS_KEY_ID
	AWS_SECRET_ACCESS_KEY_ID
	AWS_REGION
	AWS_BUCKET_ROOT_NAMESPACE
	AWS_CONNECT_INSTANCE_ID
)

env_settings = env_vars.reduce({}) {|memo, var| memo[var] = ENV[var]; memo}
missing_vars = env_vars.select{|var| env_settings.fetch(var).blank? }

# TODO - Enable it after addressing the environment variables issues with docker containers
# if missing_vars.present?
#   raise StandardError, "missing required environment variables #{missing_vars}"
# end

# Create and register the application feature with environment variables
feature  = ResourceRegistry::Feature.new({
  key: app_key,
  settings: env_settings.collect {|setting_key, value| {key: setting_key.downcase.to_sym, item: value}}
})

registry.register_feature(feature)
