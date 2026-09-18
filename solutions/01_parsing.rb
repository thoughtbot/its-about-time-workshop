# frozen_string_literal: true

module Meridian
  module Exercise01
    class Booking
      def self.call(observer:, target:, local_starts_at:)
        # `observer.zone` is an ActiveSupport::TimeZone built from an IANA zone
        # name, so it knows every DST transition that zone has had or will have.
        # We don't need to write an offset down anywhere.
        starts_at = observer.zone.parse(local_starts_at)

        # `parse` returns nil rather than raising when the string isn't a time.
        # Convert that into a loud failure *here*, while we still have the
        # context to explain it.
        if starts_at.nil?
          raise InvalidTime,
            "#{local_starts_at.inspect} is not a time we can read"
        end

        ObservationSession.new(
          observer: observer,
          target: target,
          starts_at: starts_at
        )
      end
    end
  end
end
