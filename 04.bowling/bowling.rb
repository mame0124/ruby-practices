# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

(24 - shots.count).times { shots << 0 }

shot_set = shots.each_slice(2)
index_shot_set = []
shot_set.each_with_index do |s, i|
  index_shot_set[i] = [s, [i]]
end

point = 0
index_shot_set.each_cons(3) do |s|
  case s[0][1].first
  when 0..8
    point += s[2][0].first if s[0][0].first == 10 && s[1][0].first == 10
    point += s[1][0].sum if s[0][0].first == 10
    point += s[1][0].first if s[0][0].sum == 10 && s[0][0].first != 10
    point += s[0][0].sum
    point += s[1][0].sum + s[2][0].sum if s[0][1].first == 8
  when 9
    point += s[2][0].sum
  end
end

puts point
