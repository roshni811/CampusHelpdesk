CAMPUS HELPDESK - SIMPLE ADVANCED JAVA PROJECT
==============================================

Technologies:
Java 21, Tomcat 10.1, Servlet, JSP, JDBC, MySQL, MVC, DAO, HttpSession.

NO MAVEN. NO pom.xml.

DATABASE:
Run database/helpdesk.sql in MySQL Workbench.

DEFAULT LOGINS:
Admin:   admin / admin123
Student: student / student123

IMPORTANT:
Put your MySQL Connector/J .jar inside:
WEB-INF/lib/

Example:
mysql-connector-j-9.6.0.jar

DATABASE CONNECTION:
Edit src/util/DBConnection.java only if your MySQL root password is not blank.

DEPLOYMENT:
1. Compile Java files into WEB-INF/classes.
2. Copy the whole project into:
   C:\tomcat\apache-tomcat-10.1.52\webapps\CampusHelpdesk
3. Start Tomcat.
4. Open:
   http://localhost:8080/CampusHelpdesk/

FEATURES:
- Login/logout with HttpSession
- Student creates support tickets
- Student views own tickets
- Admin views all tickets
- Admin changes ticket status
- Dashboard statistics
- JDBC PreparedStatement
- MVC + DAO separation
- JSP form validation
