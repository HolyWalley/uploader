creds = Rails.application.credentials[:aws]
Aws.config.update({
  credentials: Aws::Credentials.new(creds[:access_key_id], creds[:secret_access_key])
})
