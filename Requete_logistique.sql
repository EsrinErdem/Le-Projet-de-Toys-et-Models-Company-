SELECT products.productName, products.quantityInStock, sum(orderdetails.quantityOrdered)
FROM orderdetails
INNER JOIN products ON products.productCode = orderdetails.productCode
GROUP BY orderdetails.productCode
ORDER BY SUM(orderdetails.quantityOrdered) DESC LIMIT 5

