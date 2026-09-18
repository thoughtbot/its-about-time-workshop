module Meridian
  # A booked session: an observer, something to look at, and when.
  #
  # The value object `Booking` returns.

  class ObservationSession
    # @return [Observer]
    attr_reader :observer

    # @return [String] what the telescope points at, e.g. "Jupiter"
    attr_reader :target

    # @return [ActiveSupport::TimeWithZone] a moment that knows its own zone
    attr_reader :starts_at

    # @param observer [Observer]
    # @param target [String]
    # @param starts_at [ActiveSupport::TimeWithZone]
    def initialize(observer:, target:, starts_at:)
      @observer = observer
      @target = target
      @starts_at = starts_at
    end

    # @return [ActiveSupport::TimeWithZone]
    def local_starts_at
      starts_at.in_time_zone(observer.time_zone)
    end

    # @return [String]
    def to_s
      "#{observer.name} observing #{target} at " \
        "#{local_starts_at.strftime("%Y-%m-%d %H:%M %Z")}"
    end
  end
end
