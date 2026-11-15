# COMP 3005 – Assignment 3, Question 1: Aidan Blaj - 101296649

**Demonstration video:** https://youtu.be/JHPvInCQ8wo

## Steps to run on the course VM

The course VM already has **PostgreSQL 18** and **pgAdmin 4**. It does **not** have Java or the
PostgreSQL JDBC driver.

1. Install Java and the JDBC driver (the driver jar goes to `/usr/share/java/postgresql.jar`):
   ```bash
   sudo apt install -y openjdk-17-jdk libpostgresql-jdbc-java
   ```
2. Give the `postgres` user the password the app uses:
   ```bash
   sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
   ```
3. Get the code, create the database and load the data:
   ```bash
   git clone https://github.com/Fallendawn05/comp3005-a3.git
   cd comp3005-a3
   export PGHOST=localhost PGUSER=postgres PGPASSWORD=postgres
   createdb students_db
   psql -d students_db -f database/ddl.sql
   psql -d students_db -f database/dml.sql
   ```
4. Compile and run the app, with the driver on the classpath:
   ```bash
   javac -d out src/main/java/StudentApp.java
   java -cp out:/usr/share/java/postgresql.jar StudentApp
   ```

The connection settings (`students_db`, user `postgres`, password `postgres`) are at the top of
`src/main/java/StudentApp.java`. Running `ddl.sql` again resets the table.
