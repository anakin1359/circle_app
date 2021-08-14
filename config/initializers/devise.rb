Devise.setup do |config|
  # config.secret_key = '161fc32c5ebdfa26127e1fd05bd51dcd68e2859b6a695520ce4b82334ded01f081a81acdef80091e9e05f1040d2359da80e4b43144a9fb4590d19ee71d9a5ce0'

  # ==> Controller configuration
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'
  
  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  # config.clean_up_csrf_token_on_authentication = true
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12
  # config.pepper = 'b0f0a0696de9541daeb468c5fe7c3f122aa2babbfcdedfa43f0acbe1e9a130176bdfbd30ec4cb9fd06493516ee1eb4ad1e647c3828f5bc9bb6d8636e5c340b5c'
  # config.send_email_changed_notification = false
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  config.password_length = 6..128
  # config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # ==> Configuration for :timeoutable
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  # config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # config.navigational_formats = ['*/*', :html]
  config.sign_out_via = :delete

  # ==> OmniAuth
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # config.router_name = :my_engine
  # config.omniauth_path_prefix = '/my_engine/users/auth'

  # ==> Turbolinks configuration
  # ActiveSupport.on_load(:devise_failure_app) do
  #   include Turbolinks::Controller
  # end

  # ==> Configuration for :registerable
  # config.sign_in_after_change_password = true
end
