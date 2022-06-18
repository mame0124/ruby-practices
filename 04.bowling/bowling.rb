# frozen_string_literal: true

shots = []
ARGV[0].gsub('X', '10,0').split(',').each { |s| shots << s.to_i }
(24 - shots.count).times { shots << 0 }

shot_set_with_index = []
shots.each_slice(2).with_index do |s, i|
  shot_set_with_index << { shot_set: s, index: i }
end

point = 0
shot_set_with_index.each_cons(3) do |first, second, third|
  case first[:index]
  when 0..8
    point += third[:shot_set][0] if first[:shot_set][0] == 10 && second[:shot_set][0] == 10
    point += second[:shot_set].sum if first[:shot_set][0] == 10
    point += second[:shot_set][0] if first[:shot_set].sum == 10 && first[:shot_set][0] != 10
    point += first[:shot_set].sum
    point += second[:shot_set].sum + third[:shot_set].sum if first[:index] == 8
  when 9
    point += third[:shot_set].sum
  end
end

puts point
