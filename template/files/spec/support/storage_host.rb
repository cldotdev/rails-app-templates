# ActiveStorage testing configuration
# Sets up default host for URL generation and cleans up test files
RSpec.configure do |config|
  config.before do
    # Set default host for URL generation in tests
    # This is used by Rails routing helpers (e.g., user_url(user))
    Rails.application.routes.default_url_options[:host] = "test.example.org"

    # Set ActiveStorage URL options for generating URLs in tests
    ActiveStorage::Current.url_options = { host: "test.example.org" }
  end

  # Clean up ActiveStorage test files after all tests complete
  # Prevents test storage directory from accumulating files
  config.after(:suite) do
    FileUtils.rm_rf(Rails.root.join("tmp/storage"))
  end
end
