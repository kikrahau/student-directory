#!/usr/bin/env ruby
#define students as an empty array accessible to all methods
@students = []
#print the header with the instructions
def print_header
	puts "\n"
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
	puts "--------------"
	puts "Please enter a name,cohort and age of a student and press enter"
	puts "In case you are done entering, please type exit and press enter"
	puts "--------------"

	#create an empty array
	while true
		name=get_info("name")
		break if name == "exit"
		cohort=get_info("cohort")
		break if cohort == "exit"
		age=get_info("age")
		break if age == "exit"
		@students << {:name => name, :cohort => cohort, :age => age}
		if @students.length > 1
		puts "Now we have #{@students.length} students."
		else
		puts "Now we have #{@students.length} student."
		end
	end
	#return the array of students
	@students
end

def printing
	puts "\n"
	@students.each_with_index do |student, index|
		puts "#{index + 1}. Name:#{student[:name]} Age: #{student[:age]} Cohort:#{student[:cohort]}"	
	end
	puts "\n"
end

def print_menu
	#1. print the menu and ask the user what to do
	puts "--------------"
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list of students to students.csv"
	puts "4. Load and show previous list of students"
	puts "9. Exit"
	puts "--------------"
end

def show_students
	print_header
	printing
end

def process(selection)
	case selection
		when "1"
			#input the students
			input_students
		when "2"
			#show the students
			show_students
		when "3"
			save_list
		when
			"4"
			load_list
		when "9"
			exit # this will cause the program to terminate
		else
			puts "I don't know what you meant, try again!"
	end
end

def save_list
	#open the file for writing
	file = File.open("students.csv", "w")
	#iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:age], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	show_students
end

def load_list
	#open the file for reading it out
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
	name, age, cohort = line.chomp.split(',')
		@students << {:name => name, :age => age, :cohort => cohort}
	end
	file.close
end


def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

#call the methods
#students = input_students
#print_header
#printing(students)
#print_by_cohort(students)
interactive_menu