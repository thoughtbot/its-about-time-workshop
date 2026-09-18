module Meridian
  module Exercise04
    # An observing night.
    #
    # Observers don't count nights the way a calendar counts days. Ask anyone
    # which night they were out on and they name the evening it started: the
    # night of 18 September runs from that afternoon through to the following
    # morning. A session at 02:00 on the 19th was part of the night of the
    # 18th, and so was the one that finished at 05:00.
    #
    # A night is a date *and* whose midday you mean. Neither half is a night on
    # its own, so they are held together here and can't be handed over apart.
    #
    # ------------------------------------------------------------------------
    # YOUR JOB: make `rake e4` pass. This is the only file you need to edit.
    # Two expressions are wrong. The rest of the class is already correct.
    # Do not edit the tests.
    # ------------------------------------------------------------------------
    class ObservingNight
      # The evening the night began.
      attr_reader :date

      # Which night was this session part of?
      #
      # `instant` is a moment, as stored. `time_zone` is the observer's IANA
      # zone name, because the answer depends on whose night you mean.
      def self.covering(instant, time_zone:)
        new(instant.to_date, time_zone: time_zone)
      end

      def initialize(date, time_zone:)
        @date = date
        @time_zone = time_zone
      end

      # The window this night covers, for pulling one night's sessions out of
      # a log.
      def window
        @date.beginning_of_day..@date.end_of_day
      end
    end
  end
end
