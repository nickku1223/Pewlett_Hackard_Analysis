-- Create the table retiremet_title
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_title
FROM employees as em
INNER JOIN titles
	ON (em.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_title
FROM retirement_title as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT (title),
title
INTO retiring_title
FROM unique_title 
GROUP BY title
ORDER BY COUNT (title) DESC

-- Creating mentorship eligibility table
SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees as em
INNER JOIN dept_emp as de
	ON (em.emp_no = de.emp_no)
INNER JOIN titles
	ON (em.emp_no = titles.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no