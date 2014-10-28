Fog.mock!
Fog.credentials_path = Rails.root.join('config/application.yml')
connection = Fog::Storage.new(:provider => 'AWS')
connection.directories.create(:key => 'rantly-dev')