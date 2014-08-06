#!/usr/bin/env ruby
#create array with students
students = [
	{:name => "Vincent Koch", :cohort => :august},
	{:name => "Harry Eiertyp", :cohort => :august},
	{:name => "Peter Willi", :cohort => :august},
	{:name => "Franz Gerry", :cohort => :august},
	{:name => "William Heiopei", :cohort => :august},
	{:name => "Singh Gun Gap", :cohort => :august},
	{:name => "Xi Mei Dong", :cohort => :august},
	{:name => "Shing Shang Shong", :cohort => :august}
]
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end
#print 
def print(students)
	students.each do |student|
	puts "#{student[:name]} (#{student[:cohort]})"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end
#call the methods
print_header
print(students)
print_footer(students)
