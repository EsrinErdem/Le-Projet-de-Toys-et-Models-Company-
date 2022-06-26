SELECT sum(quantityOrdered*priceEach) AS orderamount ,customers.country
FROM orders
INNER JOIN orderdetails AS od ON  orders.orderNumber = od.orderNumber
INNER JOIN customers ON customers.customerNumber=orders.customerNumber 
WHERE status != 'cancelled' AND MONTH(orders.orderDate) BETWEEN MONTH(DATE_SUB(now(), INTERVAL 2 MONTH)) AND MONTH(now())
  AND YEAR(orders.orderDate) BETWEEN YEAR(DATE_SUB(now(), INTERVAL 2 MONTH)) AND YEAR(now())
GROUP BY customers.country
ORDER BY orderamount DESC
