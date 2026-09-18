# frozen_string_literal: true

module Meridian
  module Exercise00
    class TimeFormatter
      def self.format(time)
        time.strftime("%B %-d, %Y at %H:%M")
      end
    end
  end
end
