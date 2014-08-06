#!/usr/bin/env ruby
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def input_students
	puts "Please enter a name of a student and press enter"
	puts "In case you are done entering names, press enter twice"
	puts "--------------"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do 
		#add the student hash to the array
		students << {:name => name, :cohort => :august}
		puts "Now we have #{students.length} students"
		#get another name from the user
		name=gets.chomp
	end
	#return the array of students
	students
end

def print(students)
	index=0
	until index == students.length do
		student = students[index]
		if student[:name].slice(0).downcase == 'a' && student[:name].length < 12
		 puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
		end
		index += 1
	end
end
#call the methods
students = input_students
print_header
print(students)