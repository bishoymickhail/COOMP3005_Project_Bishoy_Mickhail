COMP 3005 Project 2021

Bishoy Mickhail 
101035492


I have created my project using JDBC and all displays and inputs will be from the command line. There are 3 java classes that need to be opened:

- Bookstore.java
- Customer.jave
- Owner.java

The main function is in the Bookstore.java file. A connection is created with JDBC local host. Username and password need to be changed for your local host in two locations (in the loginFunc and createUser methods).

A DDL file with all the tables that need to be created is given. All the tables are empty and can either be filled with the program (you start with a fresh book stroe with nothing in it and the owner must add books to begin the store) or some values can be added to the tables beforehand.

When you have done this, you can run the Bookstore class and begin the program. 

1) It will first ask if you are an existing user (owner or customer)
	- To create a user, press the option to create a new user. 
	- You will then have to fill out some information.
	- When you have completed this it will autmoatcially bring log you in and bring you to the customer or owners menu depending on if you created an "owner" or "customer".

2) If you logged in as the owner, you will see a menu to add books, remove books or generate reports. 
	- Follow the instructions and the menus.

3) If you logged in as the customer, you will see a menu for the customer specific options. 
	- Follow the instructions and the menus.

Additional notes:

	- When an order is created and/or the owner adds a book to the store, a message should pop up saying that the publisher was paid the appropriate amount of what they are owed. This is to show functionality and demonstrate that it works.
	- Please note the length of a variable when inputting.


Video Demonstration:

	- There are 3 zip files with MP4 videos of the program being run and the functionality of the program as an example.
		- Customer Vids.zip
		- Owner Vids.zip
		- Creating user.zip






