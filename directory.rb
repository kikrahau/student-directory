#!/usr/bin/env ruby
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def get_info(info)
	puts "Please enter the next students #{info}"
	information=gets.chop
	info=information.empty? ? "N/A" : information
	return info
end

def input_students
	puts "Please enter a name,cohort and age of a student and press enter"
	puts "In case you are done entering, please type exit and press enter"
	puts "--------------"
	#create an empty array
	students = []
	while true
		name=get_info("name")
		break if name == "exit"
		cohort=get_info("cohort")
		break if cohort == "exit"
		age=get_info("age")
		break if age == "exit"
		students << {:name => name, :cohort => cohort, :age => age}
		if students.length > 1
		puts "Now we have #{students.length} students."
		else
		puts "Now we have #{students.length} student."
		end
	end
	#return the array of students
	students
end

def get_cohort_list(students)
	students.map {|student| student[:cohort]}.uniq
end

def print_by_cohort(students)
	cohort_list=get_cohort_list(students)
	cohort_list.each do |cohort|
		puts "All Students in the #{cohort} cohort:"
		students.each_with_index do |student,index|
			if student[:cohort] == cohort
				printing(student,index)
			end
		end
	end
end

def printing(student, index)
	puts "#{index + 1}. Name:#{student[:name]} Age: #{student[:age]} Cohort:#{student[:cohort]}"
end
#call the methods
students = input_students
print_header
#printing(students)
print_by_cohort(students)