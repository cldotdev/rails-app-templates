# RuboCop - Ruby Code Style Checker
# https://github.com/rubocop/rubocop
#
# Features:
# - Automatic code style enforcement
# - Auto-correction for many violations
# - Customizable rules via .rubocop.yml
# - Integration with CI/CD pipelines
#
# Extensions:
# - rubocop-rails: Rails-specific cops
# - rubocop-rspec: RSpec-specific cops
# - rubocop-rspec_rails: RSpec Rails-specific cops
# - rubocop-factory_bot: FactoryBot-specific cops
# - rubocop-rake: Rake-specific cops

# Remove Rails 8.1 default rubocop-rails-omakase and its comment (replaced by custom rubocop config)
gsub_file "Gemfile", /^\s*# Omakase Ruby styling.*$\n/, ""
gsub_file "Gemfile", /^\s*gem ["']rubocop-rails-omakase["'].*$\n/, ""

gem "rubocop", group: :development
gem "rubocop-rails", group: :development
gem "rubocop-rake", "~> 0.6", group: :development
gem "rubocop-rspec", "~> 3.7", group: :development
gem "rubocop-rspec_rails", "~> 2.31", group: :development
gem "rubocop-factory_bot", "~> 2.27", group: :development
