-- Calculate the numbers of mentorship eligible employees by titles.
SELECT COUNT (emp_no),
	title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC;
	
-- Calculate the number of mentorship eligible employees for each department.
SELECT Count (me.emp_no),
	de.dept_no,
	d.dept_name
FROM mentorship_eligibility as me
LEFT JOIN dept_emp as de
	ON me.emp_no = de.emp_no
LEFT JOIN departments as d
	ON de.dept_no = d.dept_no
GROUP BY de.dept_no, d.dept_name
ORDER BY de.dept_no;

-- Calculate the number of retirees in each department
SELECT COUNT(ut.emp_no),
	de.dept_no,
	d.dept_name
FROM unique_title as ut
LEFT JOIN dept_emp as de
	ON ut.emp_no = de.emp_no
LEFT JOIN departments as d
	ON de.dept_no = d.dept_no
GROUP BY de.dept_no, d.dept_name
ORDER BY de.dept_no;


-- Calculate the total numbers of current employees.
SELECT DISTINCT (COUNT(de.emp_no)),
	de.dept_no,
	d.dept_name
FROM dept_emp as de
LEFT JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE de.to_date = '9999-01-01'
GROUP BY de.dept_no, d.dept_name
ORDER BY de.dept_no

