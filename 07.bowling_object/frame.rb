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

  def strike?
    @first_shot.mark == 'X'
  end

  def spare?
    !strike? && @first_shot.score + @second_shot.score == 10
  end

  def add_second_shot(second_shot)
    @second_shot = second_shot
    self
  end

  def add_third_shot(third_shot)
    @third_shot = third_shot
    self
  end

  def add_second_and_third_shots(second_shot, third_shot)
    @second_shot = second_shot
    @third_shot = third_shot
    self
  end
end
