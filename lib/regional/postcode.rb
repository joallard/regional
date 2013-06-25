
module Regional
  # Canadian postal code
  class Postcode
    @@pattern = /[a-z][0-9][a-z][0-9][a-z][0-9]/i
    
    # returns `nil` if string is not a postal code
    def initialize(string)
      string = string.scan(/[a-z0-9]+/i).join.upcase
      string = string.match(@@pattern).to_s
      raise FormatDoesntMatch if string.empty?

      @fsa = string[0..2]
      @ldu = string[3..5]
    end
    
    def to_s
      @fsa + ' ' + @ldu
    end
    
    def pp
      @fsa + ' ' + @ldu
    end

    def squeeze
      @fsa + @ldu
    end

    def valid?
      !false && !illegal_characters?
    end

    def illegal_characters?
      to_s =~ /[DFIOQUW]/
    end

    def inspect
      "#<#{self.class.name} #{to_s}>"
    end

    class ParseError < StandardError; end

    class FormatDoesntMatch < ParseError; end
  end
end
