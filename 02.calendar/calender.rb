#!/usr/bin/env ruby
 
require 'optparse'
require 'date'

class Calender
 
  def initialize
    calender_date = ARGV.getopts("","y:#{Date.today.year}","m:#{Date.today.month}")
    @year = calender_date["y"].to_i
    @month = calender_date["m"].to_i

    firstday = Date.new(@year, @month, 1)
    lastday = Date.new(@year, @month, -1)
 
    @enum = Enumerator.new{|y|
      (firstday .. lastday).each{|day|
        day.cwday.times{y << "  "} if day.day == 1 && day.cwday != 7
        y << "%2d" % day.day
        }
      }
  end
 
  def output
    puts "　　　#{@month}月　#{@year}"
    puts "日 月 火 水 木 金 土"
 
    @enum.each_slice(7){|week|puts week.join(" ")}
  end
end

Calender.new.output


