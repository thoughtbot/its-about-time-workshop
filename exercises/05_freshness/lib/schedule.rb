module Meridian
  module Exercise05
    # A daily reminder, at an hour the observer picked, on their own clock.
    #
    # ------------------------------------------------------------------------
    # YOUR JOB: make `rake e5` pass.
    # ------------------------------------------------------------------------
    class Schedule
      def self.daily_at(hour:, time_zone:)
        new(hour: hour, time_zone: time_zone)
      end

      def initialize(hour:, time_zone:)
        @hour = hour
        @time_zone = time_zone
      end

      def next_runs(count:, from:)
        zone = Time.find_zone!(@time_zone)

        first = from.in_time_zone(zone).change(hour: @hour, min: 0, sec: 0)
        first += 1.day while first <= from

        count.times.map { |i| first.advance(days: i) }
      end
    end
  end
end
