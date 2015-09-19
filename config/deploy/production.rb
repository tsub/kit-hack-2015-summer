set :branch, 'master'
set :rails_env, :production

role :web, %w(oz@153.120.166.12)

server '153.120.166.12', user: 'oz', roles: %w(web db app)

set :ssh_options, {
  user: 'oz',
  port: 10022,
  auth_methods: %w(publickey),
  keys: [File.expand_path('~/.ssh/oz_rsa')]
}
