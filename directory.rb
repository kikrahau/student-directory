#!/usr/bin/env ruby
#define students as an empty array accessible to all methods
require 'CSV'
@students = []
#print the header with the instructions
def print_header
	puts "\nThe students of my cohort at Makers Academy"
	puts "--------------"
end

def get_info(type)
	puts "Please enter the next students #{type}"
	info=STDIN.gets.chop
	info = "N/A" if info.empty?
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
		puts "Now #{print_footer.downcase}"
	end
	#return the array of students
	@students
end

def print_footer
	if @students.length > 1
	string = "We have #{@students.length} students."
	else
	string = "We have #{@students.length} student."
	end
	string
end

def printing
	@students.each_with_index do |student, index|
		puts "#{index + 1}. Name:#{student[:name]} Age: #{student[:age]} Cohort:#{student[:cohort]}"	
	end
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
	puts print_footer
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
			#save a list containing the students' information
			save_list
		when "4"
			#loading a list containing the students' information
			load_list
		when "9"
			exit # this will cause the program to terminate
		else
			puts "I don't know what you meant, try again!"
	end
end

def save_list
	#ask for a filename
	puts "What do you want to name your file?"
	filename=gets.chomp
	#create or open a CSV file
	CSV.open("#{filename}.csv", "w") do |csv|
	#iterate over the array of students and shovel it in a csv file
		@students.each do |student|
			student_data = [student[:name], student[:age], student[:cohort]]
			csv << student_data
		end
	end
end

def add_students (name, age, cohort)
	@students << {:name => name, :age => age, :cohort => cohort}
end

def load_list
	#ask for the filename
	puts "What's the name of your files? In case you'd like to get back to the menu, type \"menu\"."
	filename = gets.chomp
	#extract the information of a CSV file and return it as an array
		CSV.foreach("#{filename}.csv") do |row|
		name, age, cohort = row
		add_students(name, age, cohort)
		end
end

def try_load_list
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_list (filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

try_load_list
interactive_menu