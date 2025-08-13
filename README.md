# Database Management Systems - SQL Section Final Exam Solutions

![SQL](https://img.shields.io/badge/SQL-Database-blue)
![Status](https://img.shields.io/badge/Status-Complete-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

## 📋 Overview

This repository contains comprehensive solutions to a Database Management Systems final exam focusing on SQL queries, database design, and advanced SQL concepts. The exam covers fundamental to advanced SQL operations including table creation, data manipulation, joins, subqueries, views, and stored procedures.

## 🗄️ Database Schema

The exam uses a university management system with the following tables:

```sql
Students(student_id, name, dob, department_id)
Departments(department_id, department_name)
Courses(course_id, course_name, department_id)
Enrollments(enrollment_id, student_id, course_id, grade)
```

## 📚 Exam Structure

### Part A - Basic SQL (5 Marks)
- **Question 1**: Table creation with constraints (Primary Key, Foreign Key, NOT NULL, UNIQUE)
- **Question 2**: Data insertion operations
- **Question 3**: Conditional data retrieval with sorting
- **Question 4**: Aggregate functions and grouping
- **Question 5**: Data deletion operations

### Part B - Intermediate SQL (15 Marks)
- **Question 6**: Inner joins between multiple tables
- **Question 7**: Aggregate functions with HAVING clause
- **Question 8**: LEFT JOIN to find unmatched records
- **Question 9**: Complex joins with counting and ordering
- **Question 10**: Subqueries with aggregate comparisons

### Part C - Advanced SQL (10 Marks)
- **Question 1**: View creation with conditional logic
- **Question 2**: Stored procedure with parameter handling
- **Question 3**: Correlated subqueries for complex filtering

### Part D - Applied Scenario (15 Marks)
- **Comprehensive Query**: Multi-table analysis with complex aggregations and filtering

## 🔧 Key SQL Concepts Covered

- **DDL (Data Definition Language)**
  - CREATE TABLE with constraints
  - CREATE VIEW
  - CREATE PROCEDURE

- **DML (Data Manipulation Language)**
  - INSERT statements
  - UPDATE operations
  - DELETE operations

- **DQL (Data Query Language)**
  - SELECT with WHERE clauses
  - JOINs (INNER, LEFT)
  - GROUP BY and HAVING
  - ORDER BY
  - Subqueries (correlated and non-correlated)
  - Aggregate functions (COUNT, AVG, MAX, MIN)

- **Advanced Features**
  - Views for data abstraction
  - Stored procedures for reusable logic
  - Complex multi-table reporting queries

## 📁 File Structure

```
├── Part-A-Basic-SQL/
│   ├── Q1-Table-Creation.sql
│   ├── Q2-Data-Insertion.sql
│   ├── Q3-Conditional-Retrieval.sql
│   ├── Q4-Aggregate-Functions.sql
│   └── Q5-Data-Deletion.sql
├── Part-B-Intermediate-SQL/
│   ├── Q6-Inner-Joins.sql
│   ├── Q7-Aggregate-Having.sql
│   ├── Q8-Left-Join-Unmatched.sql
│   ├── Q9-Complex-Joins.sql
│   └── Q10-Subquery-Comparison.sql
├── Part-C-Advanced-SQL/
│   ├── Q1-View-Creation.sql
│   ├── Q2-Stored-Procedure.sql
│   └── Q3-Correlated-Subquery.sql
├── Part-D-Applied-Scenario/
│   └── Comprehensive-Report-Query.sql
├── Schema/
│   └── database-setup.sql
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- SQL Server, MySQL, PostgreSQL, or any SQL-compatible database system
- Basic understanding of relational database concepts

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/sql-exam-solutions.git
   cd sql-exam-solutions
   ```

2. **Create the database schema**
   ```sql
   -- Run the schema setup file
   \i Schema/database-setup.sql
   ```

3. **Execute solutions**
   ```sql
   -- Run individual solution files as needed
   \i Part-A-Basic-SQL/Q1-Table-Creation.sql
   ```

## 💡 Key Learning Outcomes

After reviewing these solutions, you should understand:

- How to design normalized database schemas with proper constraints
- Efficient data retrieval techniques using various JOIN operations
- Advanced filtering and aggregation using GROUP BY and HAVING clauses
- Subquery optimization and correlated query patterns
- View creation for data abstraction and security
- Stored procedure development for reusable database logic
- Complex analytical query writing for business reporting

## 📊 Performance Considerations

The solutions include:
- Proper indexing strategies for Primary and Foreign keys
- Optimized JOIN conditions to minimize query execution time
- Efficient use of subqueries vs. JOINs where appropriate
- Proper use of aggregate functions with GROUP BY clauses

## 🔍 Testing

Each solution has been tested with sample data to ensure:
- Correct syntax and execution
- Expected result sets
- Performance optimization
- Edge case handling

## 🤝 Contributing

Feel free to contribute by:
- Optimizing existing queries
- Adding alternative solution approaches
- Improving documentation
- Adding test cases with sample data

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

For questions or suggestions regarding these SQL solutions, please open an issue in this repository.

---

**Note**: These solutions are provided for educational purposes. Always ensure your queries are tested thoroughly before using in production environments.

## 🏆 Exam Score Breakdown

- **Part A (Basic SQL)**: 5/5 marks ✅
- **Part B (Intermediate SQL)**: 15/15 marks ✅
- **Part C (Advanced SQL)**: 10/10 marks ✅
- **Part D (Applied Scenario)**: 15/15 marks ✅

**Total Score**: 45/45 marks (100%) 🎉
