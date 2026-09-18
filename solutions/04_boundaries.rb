# frozen_string_literal: true

module Meridian
  module Exercise04
    class ObservingNight
      #  We need to decide what is the boundary of a night.
      BOUNDARY_HOUR = 12

      attr_reader :date

      def self.covering(instant, time_zone:)
        local_instant = instant.in_time_zone(time_zone)

        # Read the local hour; don't do arithmetic on the clock.
        #
        # `(local_instant - 12.hours).to_date` looks equivalent, and is, except
        # on the night the clocks go back. That local day is 25 hours long, so
        # twelve real hours before 11:00 is 00:00 the *same* morning rather than
        # 23:00 the night before, and a session at 11:00 gets filed under a
        # night that hasn't started.
        #
        date = if local_instant.hour < BOUNDARY_HOUR
          local_instant.to_date - 1
        else
          local_instant.to_date
        end

        # An observing night is not the same as a `Date`, it's a date with a
        # midday we have defined.
        new(date, time_zone: time_zone)
      end

      def initialize(date, time_zone:)
        @date = date
        @time_zone = time_zone
      end

      def window
        # Similar as `covering`: set a clock reading and let the zone define
        # the instant. Not `+ 12.hours` from midnight, which is 11:00 on the
        # night the clocks go back. `date` is already a Date object, and
        # rendering it out to text only to parse it back drops the zone on
        # purpose so that `parse` can put it back.
        opens = @date.in_time_zone(@time_zone).change(hour: BOUNDARY_HOUR)
        closes = opens.advance(days: 1)

        # `advance(days: 1)` means "the next midday", which is 23, 24 or 25
        # hours away depending on the date. `+ 24.hours` means 24 hours, which
        # is a different question and only coincidentally the same answer.
        #
        # And `...`, not `..`. This window ends exactly where the next one
        # starts, so if it included its end, a session logged at midday would
        # turn up in two nights' logs.
        opens...closes
      end
    end
  end
end
