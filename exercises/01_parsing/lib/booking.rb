module Meridian
  module Exercise01
    # Turns what an observer typed into a booked session.
    #
    # The booking form has two fields. The observer picks a date and a time:
    #
    #     Date:  2026-09-18
    #     Time:  21:00
    #
    # ...and the form posts the string "2026-09-18 21:00" to this class.
    #
    # That string means "nine in the evening, on my clock, where I am."
    #
    # ----------------------------------------------------------------------
    # YOUR JOB: make `rake e1` pass. This is the only file you need to edit.
    # Do not edit the tests.
    # ----------------------------------------------------------------------
    class Booking
      def self.call(observer:, target:, local_starts_at:)
        starts_at = Time.parse(local_starts_at)

        ObservationSession.new(
          observer: observer,
          target: target,
          starts_at: starts_at
        )
      end
    end
  end
end
