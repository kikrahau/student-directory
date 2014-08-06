#!/usr/bin/env ruby
#create array with students
students = [
	"Vincent Koch", 
	"Harry Eiertyp", 
	"Peter Willi", 
	"Franz Gerry",
	"William Heiopei",
	"Singh Gun Gap",
	"Xi Mei Dong",
	"Shing Shang Shong"
]
#print the header with the instructions
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end
#print 
def print(names)
	names.each do |name|
	puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end
#call the methods
print_header
print(students)
print_footer(students)
