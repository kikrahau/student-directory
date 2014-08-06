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

#print the array
puts "\n"
puts "The students of my cohort at Makers Academy"
puts "--------------"
students.each do |student|
	puts student
end
print "Overall, we have #{students.length} great students"