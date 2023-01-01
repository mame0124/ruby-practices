# frozen_string_literal: true

require_relative 'frame'

class Shot
  FULL_POINT = 10
  FULL_POINT_MARK = 'X'
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def score
    return unless @mark

    @mark == FULL_POINT_MARK ? FULL_POINT : @mark.to_i
  end
end
