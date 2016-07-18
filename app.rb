print 'Type word, width, height (example: rekt, 1, 1): '

s = gets.chomp
s = s.split(',').map(&:strip)
word = s[0]
width = s[1]
height = s[2]

def make_horizontal(a, width, height)
  width.times do |iw|
    a.each_with_index do |l, i|
      print l + ' ' unless (i == (a.length - 1) && (iw + 1) != width)
    end
    a.reverse!
  end
  puts "\n"
end

def make_vertical(a, width, height)
  whitespace = ' ' * (a.length + (a.length-3))
  new_a = a[1..(a.length - 2)]
  new_a.reverse! if width % 2 == 0
  new_a.each_with_index do |l, i|
    first_letter = l
    second_letter = new_a[new_a.size - (i + 1)]
    (width + 1).times do |iw|
      if iw % 2 == 0
        print (second_letter + whitespace)
      else
        print (first_letter + whitespace)
      end
    end
    puts "\n"
  end
end

def start_box(a, width, height)
  orig = a.dup
  height += 1
  height.times do |ih|
    a.each_with_index do |l, i|
      a2 = ((ih % 2 == 0) || ih == 0) ? orig.dup : orig.dup.reverse
      if (i == (a.length - 1) && ih != (height))
        make_horizontal(a2, width, height)
        make_vertical(a2, width, height) unless (ih == (height - 1))
      end
    end
  end
end

if (word.empty? || width.empty? || height.empty?)
  puts 'Invalid input. Use correct word, width, height (example: rekt, 1, 1).'
else
  word = word.upcase.scan /\w/
  width = width.to_i
  height = height.to_i
  start_box(word, width, height)
end