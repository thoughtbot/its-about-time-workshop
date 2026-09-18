require "active_support"
require "active_support/time"

# Rails loads this for you. Plain ActiveSupport does not, and without it
# `TimeWithZone#to_json` raises NoMethodError, which is a poor thing to discover
# in front of a room.
require "active_support/core_ext/object/json"

# Meridian, a stargazing session planner.
#
# Observers around the world book sessions to point a telescope at something,
# get reminded when it's time, and keep a log of what they saw.
#
# A meridian is the line the Sun crosses at local noon. Before the railways that
# was the only definition of time anyone had: noon was when the Sun was
# overhead, and it happened at a different moment in every town. Every problem
# in this workshop descends from our attempts to paper over that.
module Meridian
  # Raised when a string that was supposed to be a time isn't one.
  #
  # Worth having, because the alternative is worse. `Time.zone.parse` returns
  # `nil` for garbage rather than raising, so the failure surfaces hours later
  # and nowhere near the cause.
  class InvalidTime < StandardError; end
end

require "meridian/observer"
require "meridian/observation_session"
