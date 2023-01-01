# frozen_string_literal: true

class Frame
  FULL_POINT = 10
  attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_shot, second_shot = nil, third_shot = nil)
    @first_shot = first_shot
    @second_shot = second_shot
    @third_shot = third_shot
  end

  def score
    point = @first_shot.score
    point += @second_shot.score unless @second_shot.nil?
    point += @third_shot.score unless @third_shot.nil?
    point
  end

  def strike?
    @first_shot.mark == 'X'
  end

  def spare?
    !strike? && @first_shot.score + @second_shot.score == FULL_POINT
  end

  def add_second_shot(second_shot)
    @second_shot = second_shot
  end

  def add_third_shot(third_shot)
    @third_shot = third_shot
  end

  def add_second_and_third_shots(second_shot, third_shot)
    @second_shot = second_shot
    @third_shot = third_shot
  end
end
