# frozen_string_literal: true

require_relative 'frame'

class Shot
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def score
    return unless @mark
    return 10 if @mark == 'X'

    @mark.to_i
  end
end
