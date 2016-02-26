
#Class Portal
[Check out the Class Portal on heroku](https://cportal01.herokuapp.com/)

This Class Portal is created as a course requirement for CSC 517 Spring 2016 and is deployed on [Heroku](https://skataka-portal.herokuapp.com/login). The Class Portal implements functionalities described in this  [requirements document](https://docs.google.com/document/d/1xmeH4MAlUs6QfPoC4J4bsMKYWkawDZrsZDFM7S1G8ag/edit).

##Build Environment
* This Class Portal uses Ruby <tt>Version 2.2.3</tt>, Rails <tt>Version 4.2.4</tt> and postgres as database.
* The instructions to install Rails and setup postgres can be found [here](https://gorails.com/setup/ubuntu/15.10)
*  [RubyMine IDE](https://www.jetbrains.com/ruby/) can be used for ruby development.

###Pre-configured Admin account

| Email             | Password  |
| :---------------: |:---------:|
| admin1@admin1.com | admin1    |

###Pre-configured Teacher account

| Email           | Password  |
| :-------------: |:---------:|
|  instr1@instr1.com| instr1    |

###Pre-configured User account

| Email           | Password  |
| :-------------: |:---------:|
| student1@student1.com | student1     |



#Admin

Once you log in to the class portal as an Admin, you'll see the Admin Dashboard where all the admin functionalities are provided.

###Admin Management:

#####New Admin
* Click on the New Admin button and fill out the details like Name, Email, Password for the admin account you wish to create. 

#####Edit Profile
* You can edit your profile details by using the 'Edit profile' feature provided on the upper right corner of the Class Portal. 

#####View Admins 
* Clicking on  View Admins button will redirect you to 'Listing Admins' page where you can see the details of all other admins registered on the Class Portal. 
* Here you can Edit the details of other admins or delete their account. (Note: You can not delete your account and preconfigured admin account.)



###Course Management

#####New Course
* Click on the New Course button and fill out the course details to create a new course. 

#####View Courses
*  Click on View Courses button to see all the course details available on the Class Portal.
*  You can also edit a course(change the status of a course, etc), Enroll a student into a course, post grades for a course, add course material for a course, and delete a course.

#####Post Grades 
* On clicking the Post Grades button, you'll be redirected to a form where you can select a particular student and post grade of that student for a particular course.




###Instructor Management

#####New Instructor
* Click on the New Instructor button and fill out the details like Name, Email, Password for the instructor account you wish to create. 

#####View Instructors
*  Click on the View Instructors button will take you to 'Listing Instructors' page.
*  You can view instructor details here and also can delete an instructor profile. 




###Student Management

#####New Student
* Click on the New Student button and fill out the details like Name, Email, Password for the student account you wish to create. 

#####View Students
*  Click on the View Students button will take you to 'Listing Students' page.
*  You can view student details here and also can delete a student profile. 


