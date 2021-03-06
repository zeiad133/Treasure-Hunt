# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  # By default the authorization headers will change after each request. The
  # client is responsible for keeping track of the changing tokens. Change
  # this to false to prevent the Authorization header from changing after
  # each request.
  config.change_headers_on_each_request = false

  # By default, users will need to re-authenticate after 2 weeks. This setting
  # determines how long tokens will remain valid after they are issued.
  config.token_lifespan = 1.month

  # Sets the max number of concurrent devices per user, which is 10 by default.
  # After this limit is reached, the oldest tokens will be removed.
  # config.max_number_of_devices = 10

  # Sometimes it's necessary to make several requests to the API at the same
  # time. In this case, each request in the batch will need to share the same
  # auth token. This setting determines how far apart the requests can be while
  # still using the same auth token.
  # config.batch_request_buffer_throttle = 5.seconds

  # This route will be the prefix for all oauth2 redirect callbacks. For
  # example, using the default '/omniauth', the github oauth2 provider will
  # redirect successful authentications to '/omniauth/github/callback'
  # config.omniauth_prefix = "/omniauth"

  # By default sending current password is not needed for the password update.
  # Uncomment to enforce current_password param to be checked before all
  # attribute updates. Set it to :password if you want it to be checked only if
  # password is updated.
  config.check_current_password_before_update = :password

  # By default we will use callbacks for single omniauth.
  # It depends on fields like email, provider and uid.
  # config.default_callbacks = true

  # Makes it possible to change the headers names
  config.headers_names = {:'access-token' => 'token',
                         :'client' => 'client',
                         :'expiry' => 'expiry',
                         :'uid' => 'uid',
                         :'token-type' => 'token-type' }

  # By default, only Bearer Token authentication is implemented out of the box.
  # If, however, you wish to integrate with legacy Devise authentication, you can
  # do so by enabling this flag. NOTE: This feature is highly experimental!
  # config.enable_standard_devise_support = false

  # By default this value is expected to be sent by the client so that the API
  # knows where to redirect users after successful email confirmation. If this
  # param is set, the API will redirect to this value when no value is provided
  # by the client.
  config.default_confirm_success_url = ENV.fetch('ADMIN_DOMAIN_URL') { 'localhost:3000' }

  # By default this value is expected to be sent by the client so that the API
  # knows where to redirect users after successful password resets. If this
  # param is set, the API will redirect to this value when no value is provided
  # by the client.
  config.default_password_reset_url = ENV.fetch('ADMIN_DOMAIN_URL') { 'localhost:3000' }

  # As an added security measure, you can limit the URLs to which the API will
  # redirect after email token validation (password reset, email confirmation, etc.).
  # This value should be an array containing matches to the client URLs to be
  # visited after validation. Wildcards are supported.
  # redirect_whitelist = ['your-domain-name.com']
end
