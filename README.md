# Task Management System

A simple Task Management System built using **Spring MVC**, **Hibernate**, **PostgreSQL**, and **JSP**.  
This project runs on **Tomcat 10** with **Jakarta Servlet 6** and uses **Java 17**.

## Features

- Add new tasks
- View all tasks
- Update existing tasks
- Delete tasks

## PostgreSQL Configuration

1. Create a database:
`CREATE DATABASE task-management-db;`

2. Update database properties in:
`src/main/resources/META-INF/persistence.xml`

#### Example:
<property name="jakarta.persistence.jdbc.url" value="jdbc:postgresql://localhost:5432/task-management-db"/>
<property name="jakarta.persistence.jdbc.user" value="yourusername"/>
<property name="jakarta.persistence.jdbc.password" value="yourpassword"/>