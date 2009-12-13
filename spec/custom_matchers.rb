module CustomMatchers
  class HttpStatusCodeMatcher
    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      # Satisfy expectation here. Return false or raise an error if it's not met.

      true
    end

    def failure_message_for_should
      "expected #{@actual.inspect} to  #{@expected.inspect}, but it didn't"
    end

    def failure_message_for_should_not
      "expected #{@actual.inspect} not to  #{@expected.inspect}, but it did"
    end
  end

  def be_ok
    HttpStatusCodeMatcher.new(200)
  end

  def be_created
    HttpStatusCodeMatcher.new(201)
  end

  def be_unprocessable_entity
    HttpStatusCodeMatcher.new(422)
  end
end