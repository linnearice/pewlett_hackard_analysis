--new file Employee_Database_challenge

--create Retirement Table that holds titles of current employees who were born
--between 01-01-1952 and 12-31-1955.

Select e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
inner join titles as t on e.emp_no = t.emp_no
where birth_date between '01-01-1952' and '12-31-1955'
order by e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
into unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Use unique_titles table to find counts by retiring title
select count(*), title
into retiring_titles
from unique_titles
group by title
order by count desc;

-- create mentorship-eligibility table that holds current employees who were born between
-- January 1, 1965 and December 31, 1965

select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as t
on e.emp_no = t.emp_no
where de.to_date = '9999-01-01' and e.birth_date between '01-01-1965' and '12-31-1965'
order by e.emp_no;


