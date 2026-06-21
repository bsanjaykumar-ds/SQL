# SQL Practice — Employees & Departments

A hands-on SQL practice script covering table design, constraints, joins, aggregate functions, and views using a simple **Employees / Departments / Managers** schema. Written and tested in MySQL.

## 📂 Schema Overview

| Table | Key Columns |
|---|---|
| **Employees** | `Employees_id` (PK, AUTO_INCREMENT), `Employees_name`, `Email` (UNIQUE), `Salary`, `DeptID` (FK), `JoiningDate` |
| **Departments** | `DeptID` (PK, AUTO_INCREMENT), `DeptName` |
| **Managers** | `EmpID`, `Emp_name`, `ManagerID` (used for self-join demo) |

## ✅ Topics Covered

1. **Table creation** — `CREATE TABLE` with `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `UNIQUE`
2. **Data insertion** — `INSERT INTO` (including `NULL` values)
3. **Foreign keys** — `ALTER TABLE ... ADD CONSTRAINT ... FOREIGN KEY`
4. **Constraint violations** — inserting an invalid `DeptID` and reading the FK error
5. **Schema changes** — `ALTER TABLE ... ADD COLUMN`
6. **Updates & deletes** — `UPDATE`, `DELETE ... WHERE`
7. **Filtering & sorting** — `WHERE`, `ORDER BY`
8. **Aliases** — column aliases with `AS`
9. **Derived columns** — calculated fields (e.g., `Salary * 12`)
10. **Aggregate functions** — `COUNT`, `SUM`, `AVG`
11. **Grouping** — `GROUP BY`, `HAVING`
12. **NULL handling** — `IS NULL`, `IFNULL()`
13. **Joins** — `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and a **SELF JOIN** (Employee–Manager)
14. **Views** — `CREATE VIEW`, querying a view, updating through a view, `DROP VIEW`

## ▶️ How to Run

 Open **MySQL Workbench** or any MySQL client.


## 🛠️ Tech

- **Database:** MySQL
- **Concepts:** DDL, DML, Constraints, Joins, Aggregates, Views

## 👤 Author

**\< sanjay kumar \>**  
📧 \<your.email@example.com\>  
🔗 [LinkedIn](www.linkedin.com/in/sanjaykumar-data-science) · [GitHub](https://github.com/bsanjaykumar-ds)
