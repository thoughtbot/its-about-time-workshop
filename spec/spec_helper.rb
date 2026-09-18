# Set BEFORE anything touches Time, so the process really does run in this zone.
#
# Kiritimati is UTC+14, the furthest-forward zone on Earth and almost certainly
# not where you are sitting. That's deliberate.
#
# Any code reaching for the *machine's* time zone instead of one it was given is
# now wrong by a wild, unmissable margin, so the bug stops being theoretical.
#
# Your laptop isn't affected outside this test process.
ENV["TZ"] = "Pacific/Kiritimati"

require "bundler/setup"

require "active_support"
require "active_support/time"
require "active_support/testing/time_helpers"

# Stands in for a Rails app's `config.time_zone`.
#
# Meridian was built by a small team in Brno, so this is set to Brno. Perfectly
# reasonable decision, and the app worked flawlessly until the first observer
# outside the Czech Republic signed up.
#
# An app-wide zone still isn't *the user's* zone, and that gap is exercise 1.
Time.zone = "Europe/Prague"

# The shared library, plus every exercise's own lib/.
#
# All of it, every time, so that `bundle exec rspec` works the same way as
# `rake e1` and nobody in the room meets a LoadError instead of an exercise.
# The file names don't collide, and each spec requires the one it is about.
["lib", "exercises/*/lib"].each do |pattern|
  Dir[File.expand_path("../#{pattern}", __dir__)].each do |dir|
    $LOAD_PATH.unshift(dir)
  end
end

require "meridian"

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |expectations| expectations.syntax = :expect }

  # One line of the failing expectation, not ten.
  #
  # The examples say what they mean in their names and carry no failure
  # messages, so what is worth reading is RSpec's expected-versus-got. Echoing
  # a whole multi-line call above it just pushes that off the screen.
  config.max_displayed_failure_line_count = 1

  config.include ActiveSupport::Testing::TimeHelpers

  # ---------------------------------------------------------------------------
  # No global `travel_to`, on purpose. See "Every spec names its own dates" in
  # README.md.
  #
  # Every exercise spec writes down the dates it cares about, so there is no
  # clock for a hook to freeze: run them today, on the 31st or on a leap day and
  # you get the same answer. The helpers are included all the same, because
  # freezing the clock is the first thing worth trying on a suite of your own.
  # ---------------------------------------------------------------------------
end
