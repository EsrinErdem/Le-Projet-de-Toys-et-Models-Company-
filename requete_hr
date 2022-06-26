SELECT *
FROM (
	SELECT EXTRACT(YEAR_MONTH FROM payments.paymentDate) as D , employees.firstname, employees.lastName, 
	SUM(payments.amount) as Turnover, dense_rank() OVER (partition by D ORDER BY Turnover DESC) AS r
	FROM customers
	INNER JOIN payments ON payments.customerNumber = customers.customerNumber
	INNER JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
	GROUP BY employees.firstname, D
	ORDER BY D DESC, Turnover DESC, r
) AS sub_table
WHERE r <= 2
LIMIT 12
