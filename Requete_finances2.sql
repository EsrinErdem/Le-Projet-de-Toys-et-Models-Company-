SELECT sum(p.amount) AS paidturnover, odo.turnoverordered, (odo.turnoverordered-sum(p.amount)) AS unpaidturnover
FROM payments AS p, (SELECT sum(quantityOrdered*priceEach) AS turnoverordered FROM orderdetails
INNER JOIN orders ON orderdetails.orderNumber=orders.orderNumber
WHERE status != 'Cancelled') AS odo
