CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],                        # required
  }
  config.fog_directory  = 'rantly-dev'                          # required
  config.fog_public     = true                                        # optional, defaults to true
end