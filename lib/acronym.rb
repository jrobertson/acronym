#!/usr/bin/ruby

# file: acronym.rb

class Acronym

  attr_reader :to_a

  def initialize(a=[])
    @to_a = a.inject([]) do |r,s|
      acronym_id = acronym(s)
      acronym_id.succ! while r.include? acronym_id
      r << acronym_id
    end
  end

  private

  def acronym(raw_string)
    long_string = raw_string.clone
    long_string.gsub!(/_/,' '); a = long_string.scan(/(\b\w)/).join
    a = (a + long_string[/\B\w+$/]).slice(0,3) if a.length <= 2 
    a
  end

end
