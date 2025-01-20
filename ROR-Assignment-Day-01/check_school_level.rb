=begin
2. WAP for students to print their school level according to grade
e.g -
if grade is between 1-5 return elementary
if grade is between 6-8 return middle school
if grade is between 9-12 return high school
if grade is between otherwise return college
=end

def check_school_level(grade)
  #use case to check the grade and return the school level
  case grade
  when 1..5
    "Elementary"
  when 6..8
    "Middle School"
  when 9..12
    "High School"
  else
    "College"
  end  
end

print "Enter a School Grade:"
#Input from the user
grade = gets.strip

#print the school level based on the grade
puts (grade.match?(/^\d+$/)) ? check_school_level(grade.to_i) : "Enter a valid grade"