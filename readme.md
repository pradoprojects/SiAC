# SiAC - Sistema de Avaliação de Competências 
## SiAC - _System for Assessment of Competencies_

Welcome to the SiAC project. I conducted this project back in 2011. I developed the system in JSF + Vanilla Javascript + Hibernate + MySQL. 

I also designed the UI of the system, including its logo, icons, and buttons. A quick note to put things in perspective: back in 2011, smartphones, adaptative and responsive interfaces were still in their infancy... Given the short time I had to release the entire system -- 11 months from scratch to end -- I opted for a more straightforward and concise approach in the UI.

The purpose of the system was to help automate the process of evaluation between employees of a corporation that I worked for, in the Agricultural Research field.

I tried to make the directories name self-explanatory, but I am listing a brief description of them here:

* _dev_docs_: the documentation generated for development purposes. It includes files such as the questionnaire used to elicit the requirements, the vision document, class diagrams, etc.

* _eclipse_arquive_: the src files of the system exported from eclipse. 

* _manuals_: the documentation generated for the users of the system.

* _sql_: the SQL script file to create and populate the database for demo purposes.

* _war_: a war file generated from Eclipse to deploy the SiAC in the server (database username and password must be configured properly in the src/hibernate.cfg and tomcat server.xml files).


You can have a taste of the system in the following link:

http://52.146.2.13:8080/SiAC/faces/contas/menu.jsp

Credentials of a fictional employee (Employee X) without admin privilege in the system, having to evaluate another fictional employee (Empregado A):

> Matrícula (enrollment number): 010101

> Senha (password): 010101




