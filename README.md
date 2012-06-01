#Introducing the the acronym gem

    a = ['apples in june', 'apples in july', 'oranges in august', 'october pineapple', 'grapes']
    Acronym.new(a).to_a
    #=> ["aij", "aik", "oia", "opi", "gra"]

    a = ["apples in late june", "apples in july", "oranges in august", "october pineapple", "grapes"]
    Acronym.new(a).to_a
    #=> ["ailj", "aij", "oia", "opi", "gra"]

The Acronym gem accepts a list of phrases consisting of ideally 3 words or less and converts them into unique acronyms.

Here is the Array#acronyms method:

    class Array

      def acronyms()
        acronym = lambda {|long_string|
          long_string.gsub!(/_/,' '); a = long_string.scan(/(\b\w)/).join
          a = (a + long_string[/\B\w+$/]).slice(0,3) if a.length <= 2
          a
        }

        self.inject([]) do |r,s|
          acronym_id = acronym.call(s.clone.downcase)
          acronym_id.succ! while r.include? acronym_id
          r << acronym_id
        end
      end

    end

    ['flowers in March', 'flowers in May', 'summer wine'].acronyms
    #=> ["fim", "fin", "swi"]
