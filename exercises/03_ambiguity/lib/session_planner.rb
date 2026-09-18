module Meridian
  module Exercise03
    # Observers schedule sessions by typing a local date and time.
    #
    # ------------------------------------------------------------------------
    # YOUR JOB: make `rake e3` pass. This is the only file you need to edit.
    # Do not edit the tests.
    # ------------------------------------------------------------------------
    class SessionPlanner
      # Returns every moment this local reading could mean, on the observer's
      # own clock.
      def self.moments_for(observer:, local_time:)
        [observer.zone.parse(local_time)]
      end
    end
  end
end
