#!/usr/bin/env ruby
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def get_info(info)
	puts "Please enter the next students #{info}"
	information=gets.chomp
	info=information.empty? ? "N/A" : information
	return info
end


def input_students
	puts "Please enter a name of a student and press enter"
	puts "In case you are done entering, leave all the spaces empty and press enter"
	puts "--------------"
	#create an empty array
	students = []
	#while the name is not empty, repeat this code
	while true
		name=get_info("name")
		break if name == "exit"
		cohort=get_info("cohort")
		break if cohort == "exit"
		age=get_info("age")
		break if age == "exit"
		students << {:name => name, :cohort => cohort, :age => age}
	end
	#return the array of students
	students
end

def printing(students)
	index=0
	until index == students.length do
		student = students[index]
		puts "#{index + 1}. Name:#{student[:name]} Age: #{student[:age]} Cohort:#{student[:cohort]} cohort)"
		index += 1
	end
end
#call the methods
students = input_students
print_header
printing(students)