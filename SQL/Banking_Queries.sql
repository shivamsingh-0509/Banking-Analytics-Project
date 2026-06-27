SELECT

c.CustomerID,

c.City,

l.LoanType,

l.Amount

FROM customers c

INNER JOIN loans l

ON

c.CustomerID=l.CustomerID;

SELECT

YEAR(Date) AS Year,

MONTH(Date) AS Month,

SUM(Amount) AS TotalAmount

FROM transactions

GROUP BY

YEAR(Date),

MONTH(Date)

ORDER BY

Year,

Month;

SELECT

Type,

COUNT(*) AS NumberOfTransactions,

SUM(Amount) AS TotalAmount

FROM transactions

GROUP BY Type;


SELECT

c.CustomerID,

c.City,

c.AnnualSalary,

c.CreditScore,

l.LoanType,

l.Amount,

l.Status

FROM customers c

INNER JOIN loans l

ON c.CustomerID=l.CustomerID;


SELECT

c.CustomerID,

c.City,

l.LoanType,

l.Amount

FROM customers c

INNER JOIN loans l

ON c.CustomerID=l.CustomerID

ORDER BY l.Amount DESC

LIMIT 10;


SELECT

c.CustomerID,

c.City,

cc.CardType,

cc.CreditLimit

FROM customers c

LEFT JOIN credit_cards cc

ON

c.CustomerID=cc.CustomerID;

SELECT

BranchID,

SUM(Amount) AS TotalAmount

FROM transactions

GROUP BY BranchID

ORDER BY TotalAmount DESC;

WITH city_deposit AS

(

SELECT

c.City,

SUM(t.Amount) AS TotalDeposit

FROM customers c

INNER JOIN transactions t

ON

c.CustomerID=t.CustomerID

WHERE t.Type='Deposit'

GROUP BY c.City

)

SELECT *

FROM city_deposit

ORDER BY TotalDeposit DESC

LIMIT 5;

SELECT

CustomerID,

SUM(Amount) AS TotalDeposit,

ROW_NUMBER()

OVER(

ORDER BY SUM(Amount) DESC

)

AS Rank_No

FROM transactions

WHERE Type='Deposit'

GROUP BY CustomerID;

SELECT

YEAR(Date) AS Year,

MONTH(Date) AS Month,

SUM(Amount) AS Deposit,

LAG(

SUM(Amount)

)

OVER(

ORDER BY

YEAR(Date),

MONTH(Date)

)

AS PreviousMonth

FROM transactions

WHERE Type='Deposit'

GROUP BY

YEAR(Date),

MONTH(Date);