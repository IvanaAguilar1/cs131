#grader.awk

BEGIN {
	FS = "," #Field separator
	print "1.Sum of grades"
	print "StudentID,Name,CS146,CS131,CS100W,Total"
}

{
	#Calculate sum of student's grades
	total = $3 + $4 + $5

	#Store total sum of student grades and student info for END block
	grade_sum[$1] = total
	student_info[$1] = $1 "," $2 "," $3 "," $4 "," $5

	#Calculate highest student score
	if (total > highest) {
		highest = total
		highest_id = $1
		highest_name = $2
	}

	#Calculate lowest student score
	if (total < lowest || NR ==1) {
		lowest = total
		lowest_id = $1
		lowest_name = $2
	}
}

END {
	#Print the sum of grades for first task
	for (id in grade_sum) {
		print student_info[id] "," grade_sum[id]
	}

	#Print header for second task average grades and Pass/Fail status
	print "\n2. Average grades and Pass or Fail"
	print "StudentID,Name,CS146,CS131,CS100W,Average,Pass/Fail"

	#Calculate average grades and Pass/Fail for each student
	for (id in grade_sum) {
		total = grade_sum[id]
		average = total / 3

	#Determine Pass or Fail for average
	if (average >= 70) {
		result = "Pass"
	}else {
		result = "Fail"
	}

	#Print average and Pass/Fail for each student under task 2
	print student_info[id] "," average "," result
}

#Print higest and lowest scoring students from previous calculation
print "\n3. Highest and Lowest scoring students"
print "StudentID,Name,Total"
print highest_id "," highest_name "," highest
print lowest_id "," lowest_name "," lowest

#Print the Student Name, Total Score, Average Score, and Status(pass/fail) for each student
print "\n4. Student Summary"

#For loop to print each student summary
for (id in grade_sum) {
	#Total sum and average calculation
	total = grade_sum[id]
        average = total / 3

        #Determine Pass/Fail based on average
        if (average >= 70) {
		result = "Pass"
        } else {
		result = "Fail"
        }

        #Print the student summary
        print "\nStudent Name: " student_info[id] ","
        print "Total Score: " total
        print "Average Score: " average
        print "Status(Pass/Fail): " result
    }
    #Print Task 5 top and lowest scoring students
    print "\n5. Top and Lowest scoring students"

    #Print the Highest Scoring Student
    print "\nHighest Scoring Student"
    print "Student Name: " highest_name
    print "Total Score: " highest
    print "Average Score: " highest / 3
    print "Status(Pass/Fail): " (highest / 3 >= 70 ? "Pass" : "Fail")

    #Print the Lowest Scoring Student
    print "\nLowest Scoring Student"
    print "Student Name: " lowest_name
    print "Total Score: " lowest
    print "Average Score: " lowest / 3
    print "Status(Pass/Fail): " (lowest / 3 >= 70 ? "Pass" : "Fail")
}

