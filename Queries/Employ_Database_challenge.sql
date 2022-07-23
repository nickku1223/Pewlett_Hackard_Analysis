-- Create the table retiremet_title
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_info
FROM employees as em
INNER JOIN titles
	ON (em.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
ri.first_name,
ri.last_name,
ri.title
INTO retiree_info
FROM retirement_info as ri
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT (title),
title
INTO retiring_title
FROM retiree_info 
GROUP BY title
ORDER BY COUNT (title) DESC