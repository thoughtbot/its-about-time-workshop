# frozen_string_literal: true

module Meridian
  module Exercise02
    class Subscription
      def self.next_renewal_time(started_at:, after:)
        # Every renewal is measured from the signup date, not from the previous
        # renewal. That's what stops February's clamp becoming
        # permanent: the 31st is remembered even when a month doesn't have it.
        periods = 1
        periods += 1 while started_at.advance(months: periods) <= after

        # `advance(months:)` is calendar arithmetic. It keeps the wall-clock
        # time, so a customer billed at 09:00 stays billed at 09:00 through a
        # DST change, and it clamps to the end of a short month.
        started_at.advance(months: periods)
      end
    end
  end
end
