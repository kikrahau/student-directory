#!/usr/bin/env ruby
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def input_students
	puts "Please enter a name of a student and press enter"
	puts "In case you are done entering, leave all the spaces empty and press enter"
	puts "--------------"
	#create an empty array
	students = []
	#get the first name, cohort and the age
	print "name: "
	name = gets.chomp
	print "cohort: "
	cohort = gets.chomp
	print "age: " 
	age = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do 
		#add the student hash to the array
		students << {:name => name, :cohort => cohort, :age => age}
		puts "Now we have #{students.length} students"
		#get another name from the user
		print "name: "
		name = gets.chomp
		print "cohort: "
		cohort = gets.chomp
		print "age: " 
		age = gets.chomp
	end
	#return the array of students
	students
end

def printing(students)
	index=0
	until index == students.length do
		student = students[index]
		puts "#{index + 1}. #{student[:name]} is #{student[:age]}(#{student[:cohort]} cohort)"
		index += 1
	end
end
#call the methods
students = input_students
print_header
printing(students)