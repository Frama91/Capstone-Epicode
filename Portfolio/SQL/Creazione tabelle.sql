create database if not exists Portfolio_SQL;
use Portfolio_SQL;

create table if not exists Clients(
 	ID_Client varchar(20),
  Name varchar(255),
  Country varchar(5),
  Dimension varchar (10),
  EmployeesNumber int,
  Field_ varchar(255),
  
  primary key(ID_Client)
  );


create table if not exists Employees(
  Code_F varchar(20),
  Name varchar(255),
  Surname varchar(255),
  Birth Date,
  Birth_Country varchar(10),
  Gender varchar(10),
  Role varchar(255),
  Experience varchar(255),
  Salary_USD int(255),

  primary key(Code_F)
  );
  
create table if not exists Products(
  ID_Product varchar (20),
  Product_Name varchar (255),
  Category varchar (255),
  Gross_Price smallint(255),
  Perc_Margin tinyint(255),
  Selling_Price smallint(255),
  
  primary key (ID_Product)
  );
  
create table if not exists Sales(
	ID_Sale varchar(20),
  IDS_Product varchar(20) references ID_Product(Products),
  Seller_Code varchar(20) references Code_F(Employees),
  IDS_Client varchar(20) references ID_Client(Clients),
  Quantity_sold smallint(255),
  Sale_Date Date,
  
  primary key (ID_Sale)
  );
  



