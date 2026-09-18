# frozen_string_literal: true

module Meridian
  module Exercise03
    class SessionPlanner
      def self.moments_for(observer:, local_time:)
        # UTC has never had a transition, so it is the one zone that can hold a
        # reading without deciding anything: 02:30 goes in and 02:30 comes out,
        # always.
        naive = Time.find_zone!("UTC").parse(local_time)
        tzinfo = observer.zone.tzinfo

        # Then ask the zone what that reading means.
        # `TZInfo::Timezone#local_to_utc` is able to say when a reading is
        # ambiguous or impossible.
        # `ActiveSupport::TimeZone#parse` 's signature is to return a `Time`
        # object, so it does even if it has to default to something different
        # the developer wanted.
        #
        # The two exceptions are the two branches, they are not really errors,
        # they are special cases from the tz database.
        utcs =
          begin
            [tzinfo.local_to_utc(naive)]
          rescue TZInfo::AmbiguousTime
            # Both, in the order a human reads them: summer time, then winter
            # time, through the `dst` (second) parameter.
            [
              tzinfo.local_to_utc(naive, true),
              tzinfo.local_to_utc(naive, false)
            ]
          rescue TZInfo::PeriodNotFound
            # No moment matches, so there is nothing to return and nothing to
            # invent. An empty list is an honest answer.
            []
          end

        # TZInfo speaks `Time`, always in UTC. Hand back `TimeWithZone`s on the
        # observer's own clock.
        utcs.map { |utc| utc.in_time_zone(observer.time_zone) }
      end
    end
  end
end
