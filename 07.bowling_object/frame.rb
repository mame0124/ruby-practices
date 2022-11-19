# frozen_string_literal: true

class Frame
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

  def spare?
    !@first_shot.strike? && @first_shot.score + @second_shot.score == 10
  end

  def add_one_shot(third_shot)
    @third_shot = third_shot
    self
  end

  def add_two_shots(second_shot, third_shot)
    @second_shot = second_shot
    @third_shot = third_shot
    self
  end
end
