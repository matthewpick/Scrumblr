Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, GITHUB_CONFIG['app_id'], GITHUB_CONFIG['secret'], scope: 'user:email, user:follow'
end
