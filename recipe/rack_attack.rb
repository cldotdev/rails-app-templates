# Rack Attack - Rate Limiting and Throttling
# https://github.com/rack/rack-attack
#
# Rack middleware for blocking and throttling abusive requests.
# Essential for API security and DDoS protection.
#
# Features:
# - Rate limiting (requests per time period)
# - Throttling (gradually slow down requests)
# - Blocklists and allowlists (IP addresses, user agents)
# - Custom rules with flexible conditions
#
# Common use cases:
# - Prevent brute-force attacks (login, password reset)
# - API rate limiting (per user, per IP)
# - Block malicious bots and scrapers
# - Prevent excessive signups from same IP
#
# Note: Requires Redis/Valkey for distributed rate limiting (already configured)

gem "rack-attack"

after_bundle do
  copy_file from_files("config/initializers/rack_attack.rb"),
            "config/initializers/rack_attack.rb", force: true

  copy_file from_files("spec/requests/security_spec.rb"),
            "spec/requests/security_spec.rb"
end
