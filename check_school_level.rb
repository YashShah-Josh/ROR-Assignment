def check_school_level(grade)
  if 1<= grade && grade <= 5
    return "Elementary"
  elsif 6<= grade && grade <= 8
    return "Middle School"
  elsif 9<= grade && grade <= 12
    return "High School"
  else
    return "College"

  end
end

print "Enter a School Grade:"

grade = gets.strip

if grade.match(/^\d+$/)
  puts check_school_level(grade.to_i)
else
  puts ("Enter a valid grade")
end
