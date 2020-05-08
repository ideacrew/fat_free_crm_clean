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
env_vars = {
  aws: {
    namespace: [:system, :services],
    settings: %w(
    	AWS_ACCESS_KEY_ID
    	AWS_SECRET_ACCESS_KEY
    	AWS_REGION
    	AWS_BUCKET_ROOT_NAMESPACE
    	AWS_CONNECT_INSTANCE_ID
    )
  },
  smtp: {
    namespace: [:system, :services, :aws],
    settings: %w(
      ACTION_MAILER_HOST
      SMTP_PORT
      SMTP_HOST
      SMTP_DOMAIN
      SMTP_USERNAME
      SMTP_PASSWORD
    )
  }
}

env_vars.each do |feature_key, parts|
  
  env_settings = parts[:settings].reduce({}) {|memo, var| memo[var] = ENV[var]; memo}
  
  missing_vars = parts[:settings].select{|var| env_settings.fetch(var).blank? }

  # TODO - Enable it after addressing the environment variables issues with docker containers
  if missing_vars.present?
    raise StandardError, "missing required environment variables #{missing_vars}"
  end

  # Create and register the application feature with environment variables
  feature  = ResourceRegistry::Feature.new({
    key: feature_key,
    namespace: parts[:namespace],
    is_enabled: true,
    settings: env_settings.collect {|setting_key, value| {key: setting_key.downcase.to_sym, item: value}}
  })

  registry.register_feature(feature)
end

# if registry.feature_enabled?(:boot)
#   requested_services = registry[:boot].setting(:services).item
#   requested_services.each do |service|
#     feature = registry[:boot] { service }

#     if feature.success?
#       registry.register_feature(feature.value!)
#     else
#       raise feature.errors.to_s
#     end
#   end
# end


