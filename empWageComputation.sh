#!/bin/bash -x

echo "Welcome to Employee
Wage Computation
Program"
#!/bin/bash -x

#empCheck=$((RANDOM%3))


#Constants

IS_PART_TIME=1
IS_FULL_TIME=2
EMP_WAGE_PER_HR=20
MAX_WORKING_HRS=100
NUMBER_OF_WORKING_DAYS=20

#Variables

totalEmpHr=0
totalWorkingDays=0


declare -A daily_emp_wage

#Option2 (With Creating function)
function getDailyWage()
{
        local empHrs=$1
        empSalary=$((empHrs*EMP_WAGE_PER_HR))
        echo $empSalary
}

function getTotalWage()
{
        local empHrs=$1
        empSalary=$((empHrs*EMP_WAGE_PER_HR))
        echo $empSalary
}



function getEmpHrs()
{
        case $empCheck in
                $IS_PART_TIME)
                        #echo "Employee is Part-Time"
                        empHr=4
                ;;
                $IS_FULL_TIME)
                        #echo "Employee is Full-Time"
                        empHr=8
                ;;
                *)
                        #echo "Employee is Absent"
                        empHr=0
                ;;
        esac

        echo $empHr
}


while [[ $totalEmpHr -le $MAX_WORKING_HRS && $totalWorkingDays -le $NUMBER_OF_WORKING_DAYS ]]
do
        ((totalWorkingDays++))
        empCheck=$((RANDOM%3))

        empHr=$( getEmpHrs $empCheck )
        #Option1 (Without creating function getDailyWage)
        #daily_emp_wage[((totalWorkingDays))]=$((EMP_WAGE_PER_HR*empHr))

        #For Using Function (getDailyWage)
        #daily_emp_wage[((totalWorkingDays))]=$( getDailyWage $empHr )


	#Creating Dictionary(daily_emp_wage)
	daily_emp_wage["Day"$totalWorkingDays]="$( getDailyWage $empHr )"


        totalEmpHr=$((totalEmpHr+empHr))
        #Option1 (Without creating function getTotalWage)
        #totalEmpHr=$((totalEmpHr+empHr))
        #totalSalary=$((totalEmpHr*EMP_WAGE_PER_HR))


        #For Using Function (getDailyWage)
        totalSalary=$( getTotalWage $totalEmpHr )
done

echo "Values of daily_emp_wage Dictionary: "${daily_emp_wage[@]}
#echo "Total Wage of Emp: "$totalSalary
echo "Keys of daily_emp_wage Dictionary: "${!daily_emp_wage[@]}
