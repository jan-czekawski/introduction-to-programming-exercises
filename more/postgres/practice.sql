-- SELECT version();

-- CREATE DATABASE practice;
-- \c practice
-- \c dvdrental
-- DROP DATABASE groceries;

-- CREATE TABLE company(
--   ID INT PRIMARY KEY      NOT NULL,
--   NAME           TEXT     NOT NULL,
--   AGE            INT      NOT NULL,
--   ADDRESS        CHAR(50) NOT NULL,
--   SALARY         REAL
-- );

CREATE TABLE department(
  ID INT PRIMARY KEY      NOT NULL,
  DEPT           CHAR(50) NOT NULL,
  EMP_ID         INT      NOT NULL
);