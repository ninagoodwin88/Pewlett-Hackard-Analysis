-- DROP TABLE ret_info;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no, e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO ret_info
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.title DESC;

SELECT * FROM ret_info

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no,
re.first_name,
re.last_name,
re.title
INTO unique_titles
FROM ret_info AS re
ORDER BY re.emp_no ASC, re.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(un.title), un.title
INTO retiring_titles
FROM unique_titles AS un
GROUP BY un.title
ORDER BY un.count DESC;

SELECT * FROM retiring_titles
