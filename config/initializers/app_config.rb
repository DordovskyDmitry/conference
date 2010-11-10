APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")

if APP_CONFIG && APP_CONFIG['authentication']
  PAS_SALT = APP_CONFIG['authentication']['password_salt']
  CRYPTED_PAS = APP_CONFIG['authentication']['crypted_password']
end