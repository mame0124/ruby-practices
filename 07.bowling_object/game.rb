# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'

class Game
  def initialize(all_shots)
    @all_frames = Array.new(10) do
      shot = Shot.new(all_shots.shift)
      frame = Frame.new(shot)
      frame.add_second_shot(Shot.new(all_shots.shift)) unless frame.strike?
      frame
    end

    if @all_frames[-1].strike?
      @all_frames[-1].add_second_and_third_shots(Shot.new(all_shots.shift), Shot.new(all_shots.shift))
    elsif @all_frames[-1].spare?
      @all_frames[-1].add_third_shot(Shot.new(all_shots.shift))
    end
  end

  def score
    point = 0
    @all_frames.each_cons(3).with_index do |frames, index|
      point += frames[0].score
      if frames[0].strike?
        point += frames[1].score
        point += frames[2].first_shot.score if frames[1].strike?
      end
      point += frames[1].first_shot.score if frames[0].spare?
      if index == 7
        point += frames[1].score
        point += frames[2].score
        point += frames[2].first_shot.score + frames[2].second_shot.score if frames[1].strike?
        point += frames[2].first_shot.score if frames[1].spare?
      end
    end
    point
  end
end
