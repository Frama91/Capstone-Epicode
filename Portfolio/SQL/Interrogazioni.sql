
use Portfolio_SQL;

-- Dipendente con lo stipendio più alto
Select CONCAT(Name," ",Surname) as "Full Name",
      Role,
      Experience,
      max(Salary_USD) as Salary
From employees;

-- Numero di Dipendenti per paese di origine
Select employees.Birth_Country,
				count(Code_F) as "Number of Employees"
From employees
group by employees.Birth_Country;

-- Numero di Dipendenti per Ruolo, divisi per Esperienza e Sesso e calcolo stipendio medio
Select employees.Role as "Ruolo",
			employees.Experience as "Esperienza",
      employees.Gender as "Genere",
      count(employees.Code_F) as "Numero di Dipendenti",
      FORMAT(AVG(employees.Salary_USD),0) as "Stipendio Medio"
From employees
group by Ruolo,Esperienza, Genere
order by Ruolo ASC, CASE
			WHEN Esperienza = "Junior" then 1
      WHEN Esperienza = "Intermediate" then 2
      WHEN Esperienza = "Senior" then 3
      WHEN Esperienza = "Lead/Manager" then 4
      end ASC,
      Genere ASC;
      
-- Calcolo età di ogni dipendente
Select CONCAT(employees.Name, " ", employees.Surname) as "Full Name",
			 DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),employees.Birth)), '%Y') + 0 as age
from employees;

-- Statistiche anagrafiche
Select employees.Gender as "Genere",
				COUNT(employees.Code_F) as "Totale Dipendenti",
			 MAX(DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),employees.Birth)), '%Y') + 0) as "Età massima",
			 MIN(DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),employees.Birth)), '%Y') + 0) as "Età minima",
       ROUND(AVG(DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),employees.Birth)), '%Y') + 0),1) as "Età Media",
       ROUND(AVG(employees.Salary_USD),0) as "Stipendio Medio"
from employees
group by employees.Gender;

--  Statistiche Prodotti
Select 
	products.Product_Name as "Nome prodotto",
	CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * products.Selling_Price),0)) as "Totale Fatturato",
  CONCAT(products.Perc_MArgin," %") as "Margine",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * (products.Selling_Price - products.Gross_Price)),0)) as "Guadagno Netto realizzato",
	CONCAT(FORMAT(SUM(sales.Quantity_sold),0), "  pcs") as "Qantità totale venduta"
from sales 
inner join products on sales.IDS_Product = products.ID_Product
group by products.Product_Name;

-- Statistiche Venditori
Select
	CONCAT(employees.Name," ",employees.Surname) as "Full Name",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * products.Selling_Price),0)) as "Totale Fatturato",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * (products.Selling_Price - products.Gross_Price)),0)) as "Guadagno Netto realizzato",
  CONCAT(FORMAT(SUM(sales.Quantity_sold),0), "  pcs") as "Qantità totale venduta",
  COUNT(sales.ID_Sale) as "Numero Vendite"
from sales
inner join employees on sales.Seller_Code = employees.CODE_F
inner join products on sales.IDS_Product = products.ID_product
inner join clients on sales.IDS_Client = clients.ID_Client
group by sales.Seller_Code;

-- Statistiche Clienti
Select
	clients.Name as "Nome Cliente",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * products.Selling_Price),0)) as "Totale Fatturato",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * (products.Selling_Price - products.Gross_Price)),0)) as "Guadagno Netto realizzato",
  CONCAT(FORMAT(SUM(sales.Quantity_sold),0), "  pcs") as "Qantità totale venduta",
  COUNT(sales.ID_Sale) as "Numero Fatture Acquisto"
from sales
inner join employees on sales.Seller_Code = employees.CODE_F
inner join products on sales.IDS_Product = products.ID_product
inner join clients on sales.IDS_Client = clients.ID_Client
group by clients.ID_CLient;

-- Vendite per Mese/Anno
Select
	DATE_FORMAT(sales.Sale_Date,"%Y") as "Anno",
  DATE_FORMAT(sales.Sale_Date,"%M") as "Mese",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * products.Selling_Price),0)) as "Totale Fatturato",
  CONCAT("$  ",FORMAT(SUM(sales.Quantity_sold * (products.Selling_Price - products.Gross_Price)),0)) as "Guadagno Netto",
  COUNT(sales.ID_Sale) as "Numero Fatture"

from sales
inner join products on sales.IDS_Product = products.ID_Product
group by Anno, Mese
order by Anno ASC, DATE_FORMAT(sales.Sale_Date,"%m") ASC;


