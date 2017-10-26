#!/bin/bash 
start-all.sh
show_menu()

{

    NORMAL=`echo "\033[m"`

    MENU=`echo "\033[36m"` #Blue

    NUMBER=`echo "\033[33m"` #yellow

    FGRED=`echo "\033[41m"`

    RED_TEXT=`echo "\033[31m"`

    ENTER_LINE=`echo "\033[33m"`

    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"

    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?
   ${NORMAL}"
    
    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications. ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.${NORMAL}"

    echo -e "${MENU}**${NUMBER} 5) ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern 
    of All the cases over the period of time.${NORMAL}"

    echo -e "${MENU}**${NUMBER} 9) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"

    echo -e "${MENU}**${NUMBER} 10) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in 
    descending order${NORMAL}"

    echo -e "${MENU}**${NUMBER} 11) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed 
    more than 1000?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 12) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more
    than 1000? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 13) ${MENU}Export result for option no 12 to MySQL database.${NORMAL}"

    echo -e "${MENU}*********************************************${NORMAL}"

    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"

    read opt
    
}

    function option_picked()
    
{

    COLOR='\033[01;31m' # bold red

    RESET='\033[00;00m' # normal white

    MESSAGE="$1"  #modified to post the correct option selected

    echo -e "${COLOR}${MESSAGE}${RESET}"

    }
    
clear
    
show_menu

while [ opt != '' ]

                   do
                     if [[ $opt = "" ]]; then 
                     exit;
                      else
                        case $opt in
        
1) clear;
option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
hadoop jar question1a.jar question1a /user/hive/warehouse/h1b_final /niit/output55
show_menu;
;;

2) clear;
option_picked "1 b) Find top 5 job titles who are having highest growth in applications. ";
pig ques1b.pig
show_menu;
;;
           
3) clear;
option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
hadoop jar question2a.jar Q2a /user/hive/warehouse/h1b_final /niit/output2
show_menu;
;;

4) clear;
option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
read var
hive -e " select worksite,count(case_status) as t,year from h1b_final where year ='$var' and case_status='CERTIFIED' group by worksite,year order by t desc limit 5; "
show_menu;
;;
  
5) clear;
option_picked "3) Which industry has the most number of Data Scientist positions?";
hadoop jar question3.jar Q3 /user/hive/warehouse/h1b_final /niit/output33
show_menu;
;;

6) clear;
option_picked "4)Which top 5 employers file the most petitions each year?";
hadoop jar question4.jar Q4 /user/hive/warehouse/h1b_final /niit/output44
show_menu;
;;

7) clear;
option_picked "5a) Find the most popular top 10 job positions for H1B visa applications for each year?";
echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
read var
echo "Find the most popular top 10 job positions for H1B visa applications for each year?";
hive -e "select job_title,year,count(case_status) as temp from h1b_final where year ='$var' group by job_title,year order by temp desc limit 10; "
show_menu;
;;

8) clear;
option_picked "5b) Find the most popular top 10 job positions for H1B visa applications for each year?";
echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
read var
echo "Find the most popular top 10 job positions for H1B visa applications for each year?";
hive -e "select job_title,year,count(case_status) as temp from h1b_final where year ='$var' and case_status='CERTIFIED' group by job_title,year order by temp desc limit 10; "
show_menu;
;;
        
9) clear;
option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";

pig ques6.pig
show_menu;
;;

10) clear;
option_picked "7) Create a bar graph to depict the number of applications for each year";
hive -e "select year,count(*) from h1b_final group by year order by year;"
show_menu;
;;
		
11) clear;
option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
echo -e "Enter the year(2011,2012,2013,2014,2015,2016)"
read year
echo -e "Enter the choice Full time/ Part time.(Y/N)"
read var
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='$VAR' and year='$year' and case_status in('CERTIFIED','CERTIFIED WITHDRAWN') group by job_title,full_time_position,year order by average desc;"


show_menu;
;;

12) clear;
option_picked "9) Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
pig ques9.pig
show_menu;
;;
		
13) clear;
option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
pig question10.pig
show_menu;
;;
		
14) clear;
option_picked "11) Export result for question no 10 to MySql database."
  mysql -u root -p'surbhi' -e 'drop table project.question11'; 
                mysql -u root -p'surbhi' -e 'use proect;create table question11(job_title varchar(100),success_rate float,petitions int);';
                sqoop export --connect jdbc:mysql://localhost/project --username root --password 'surbhi' --table question11 --update-mode allowinsert --export-dir 'hdfs://localhost:54310/niit/question10ans' --input-fields-terminated-by '\t';
                echo -e '\n\nDisplay contents from MySQL Database.\n\n'
                echo -e '\n10) Which are the top 10 job positions that have  success rate more than 70% in petitions and total petitions filed more than 1000?\n\n'
                mysql -u root -p'surbhi' -e 'select * from project.question11 order by success_rate desc';
show_menu;
;;

\n) exit;   

		;;

        *) clear;

        option_picked "Pick an option from the menu";
        show_menu;
        ;;

    esac

fi

done
