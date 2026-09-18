module Meridian
  module Exercise02
    # Meridian Pro bills monthly. This works out when the next payment is due.
    #
    # ------------------------------------------------------------------------
    # YOUR JOB: make `rake e2` pass. This is the only file you need to edit.
    # Do not edit the tests.
    # ------------------------------------------------------------------------
    class Subscription
      def self.next_renewal_time(started_at:, after:)
        renewal = started_at
        renewal += 30.days while renewal <= after
        renewal
      end
    end
  end
end
