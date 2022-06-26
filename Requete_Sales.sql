SELECT productLine, month(orderDate) as month, year(orderDate) as year, sum(quantityOrdered) as totalorder 
FROM
(SELECT d.orderNumber,d.productCode, d.quantityOrdered,p.productLine,p.productName,
      o.orderDate, o.shippedDate, o.status
FROM orderdetails as d
INNER JOIN orders as o ON d.orderNumber=o.orderNumber
INNER JOIN products as p ON p.productCode=d.productCode
WHERE o.status!= 'Cancelled'  AND orderdate > DATE_SUB(NOW(), INTERVAL 24 MONTH)) AS T
GROUP BY productLine, year(orderDate), month(orderDate)
ORDER BY totalorder DESC,productLine ASC,month ASC,year ASC
