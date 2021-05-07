# Truy vấn danh sách các Customer 

use ABC;

# 1) Truy vấn danh sách các Customer 
#select CustomerID   from Customers
#limit 10;
# 1) Truy van danh sach cac customer voi country la Finland
#select count(Country) as num_coun from Customers
#where Country = 'Finland'; 
# 2) 
#select CustomerID, ContactName from Customers;
#select CustomerID, ContactName, REPLACE(ContactName,SUBSTRING_INDEX(ContactName,' ',-1),'') as First_Name, SUBSTRING_INDEX(ContactName,' ',-1) as Last_Name   from Customers;
# 3) Cho biết có bao nhiêu khách hàng từ Germany và UK, đó là những khách hàng nào
#select CustomerID, REPLACE(ContactName,SUBSTRING_INDEX(ContactName,' ',-1),'') as First_Name, SUBSTRING_INDEX(ContactName, ' ',-1) as Last_Name, Country from Customers
#where Country = 'Germany' OR Country = 'UK'; 
# 4) Liệt kê danh sách khách hàng theo thứ tự tăng dần của FirstName và giảm dần của Country
#select CustomerID, REPLACE(ContactName, SUBSTRING_INDEX(ContactName, ' ', -1),'') as First_Name, SUBSTRING_INDEX(ContactName,'',-1) as Last_Name, Country  from Customers
#order by First_Name ASC, Country DESC;

# 5) Truy vấn danh sách các khách hàng với ID là 5,10, từ 1-10, và từ 5-10
#select CustomerID, ContactName from Customers 
#where CustomerID = 'WOLZA' or CustomerID = 'WARTH';
# from 1 to 10 
#select CustomerID, ContactName as Contact_Name from Customers 
#where CustomerID BETWEEN 'ALFKI' and 'BOTTM'
#Order by CustomerID; 
# from 5 to 10 
#select CustomerID, ContactName as Contact_Name from Customers
#where CustomerID  between 'BERGS'  and  'BOTTM'
#Order by CustomerID;  
# 6) Truy vấn các khách hàng ở các sản phẩm (Product) mà đóng gói dưới dạng bottles có giá từ 15 đến 20 mà không từ nhà cung cấp có ID là 16 .
select UnitPrice as Unit_Price,ProductName as Product_Name, Discontinued from Products
where Discontinued = 0;