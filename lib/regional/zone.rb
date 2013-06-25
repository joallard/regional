module Regional
  class Zone
    attr_reader :components

    def initialize(zone)
      @components = zone.split(/,\s*/).map do |str| 
        array = str.split("-")

        if array.count == 1
          array.first...array.first.succ
        elsif array.count == 2
          array.first...array.last.succ
        else
          raise ArgumentError, "Range can only have one hyphen"
        end
      end

      @components[0] ||= "0".."ZZZZZZ"
    end

    def cover?(area)
      @components.map{ |c| c.cover?(area.squeeze) }.inject do |m,o|
        m || o
      end
    end

    def inspect
      "#<#{self.class.name} #{@components.join(", ")}>"
    end
  end
end
