# Rails 4.1+ has built-in time helpers via ActiveSupport::Testing::TimeHelpers
# No need for timecop gem
# Reference: https://api.rubyonrails.org/classes/ActiveSupport/Testing/TimeHelpers.html

RSpec.configure do |config|
  # Include Rails' built-in time helpers (travel_to, freeze_time, etc.)
  config.include ActiveSupport::Testing::TimeHelpers

  # Ensure time is unfrozen after each test to prevent leakage
  # Use freeze_time/travel_to within individual tests as needed
  config.after do
    travel_back
  end
end

# Migration guide from Timecop to Rails TimeHelpers:
#
# Timecop.freeze(time) { ... }    → freeze_time(time) { ... }
# Timecop.travel(time) { ... }    → travel_to(time) { ... }
# Timecop.return                  → travel_back or unfreeze_time
# Timecop.scale(scalar) { ... }   → (not available in TimeHelpers)
