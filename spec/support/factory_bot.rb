require_relative '../helpers/factories'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Helpers::Factories
end
