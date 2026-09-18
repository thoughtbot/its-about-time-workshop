module Meridian
  # Someone who books sessions to go outside and look up.
  #
  # Note what `time_zone` is: an IANA zone *name* (i.e., "Europe/Prague"), not a
  # UTC offset (i.e., "+01:00").

  class Observer
    # @!attribute [r] name
    #   @return [String]
    attr_reader :name

    # An IANA zone name, e.g. "Europe/Prague".
    # @return [String]
    attr_accessor :time_zone

    # @param name [String]
    # @param time_zone [String] an IANA zone name
    def initialize(name:, time_zone:)
      @name = name
      @time_zone = time_zone
    end

    # The zone object itself, ready to parse and convert.
    # @return [ActiveSupport::TimeZone]
    # @raise [ArgumentError] if `time_zone` is not a known IANA name
    def zone
      Time.find_zone!(time_zone)
    end

    # @return [String]
    def to_s
      "#{name} (#{time_zone})"
    end
  end
end
