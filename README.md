# Friends-Maintenance

This is a simple web application for managing friends using Java Servlets and a MySQL database. It provides functionality to add and delete friends from a database table.

## Prerequisites
Java Development Kit (JDK)
MySQL database server
Servlet container (e.g., Apache Tomcat)

## Setup
Clone the repository or download the source code files.
Import the project into your Java IDE.
Set up the MySQL database and adjust the database connection details in the V_97_FriendObj class.
Build and deploy the project to your servlet container.

## Usage
Add Friend
Access the add friend form by navigating to the URL where the servlet is deployed (http://localhost:8080/C_97_AddQuery).
Enter the friend details in the form, including friend ID, name, email address, age, and favorite color.
Submit the form.
The servlet will validate the input and store the friend information in the MySQL database.
The servlet will then redirect to the V_97_View.jsp page, where you can view all the friends.
Delete Friend
Access the delete friend form by navigating to the URL where the servlet is deployed (http://localhost:8080/C_97_DeleteQuery).
Enter the friend ID of the friend you want to delete in the form.
Submit the form.
The servlet will validate the input, delete the corresponding friend from the MySQL database, and redirect to the V_97_View.jsp page to display the updated list of friends.

## Contributing
Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please feel free to submit a pull request or open an issue.
