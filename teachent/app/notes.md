
## Overview
I am going to create an app where users can keep track of their courses and progress.

## Users will be able to 
log in, sign up, log out

## Users will also be able to: 
create or select courses
see all courses
edit courses
delete courses

Attributes
## User(student)
slug
email
name
occupation

## Associations
User has many subjects through course
User has many courses



# Course
name
#description

## Associations
Course belongs to subject
Course belongs to user


## Subject
name

## Associations
Subject has many users through course
Subject has many courses

## MVP 
log in, sign up, log out
create courses
see all courses
edit courses
delete courses

## Stretch goals
CSS
users can choose to make entries public or private
progress meter (number of pages or lessons -- what lesson they are on == percentage completed)






