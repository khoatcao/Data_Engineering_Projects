use ABC;
# 1) 
#Xuất danh sách các nhà cung cấp 
#(gồm Id, CompanyName, ContactName, City, Country, Phone) 
#kèm theo giá min và max của các sản phẩm mà nhà cung cấp đó cung cấp. 
#Có sắp xếp theo thứ tự Id của nhà cung cấp (Gợi ý : Join hai bản Supplier và Product, dùng GROUP BY tính Min, Max)

#select Suppliers.SupplierID as Supplier_ID, Suppliers.CompanyName as Company_Name, Suppliers.ContactName as Contact_Name,Suppliers.City as City, Suppliers.Country,Suppliers.Phone,
#min(Products.UnitPrice) as Min_Price, max(Products.UnitPrice) as Max_Price 

#from Suppliers,Products
#where Suppliers.SupplierID = Products.SupplierID
# the default in ascending order 
#group by Suppliers.SupplierID
#order by Suppliers.SupplierID

# 2) 
#Cũng câu trên nhưng chỉ xuất danh sách nhà cung cấp có sự khác biệt giá (max – min) không quá lớn (<=30).(Gợi ý: Dùng HAVING)
#select Suppliers.SupplierId as Supplier_ID, Suppliers.CompanyName as Company_Name, Suppliers.ContactName as Contact_Name, Suppliers.City as City, Suppliers.Country, Suppliers.Phone, 
#min(Products.UnitPrice) as Min_Price, max(Products.UnitPrice) as Max_Price

#from Suppliers, Products
#where Suppliers.SupplierID = Products.SupplierID 
#Group by Suppliers.SupplierID
#having Max_Price - Min_Price <=  30;

# 3) Xuất danh sách các hóa đơn (Id, OrderNumber, OrderDate) 
#kèm theo tổng giá chi trả (UnitPrice*Quantity) cho hóa đơn đó, 
#bên cạnh đó có cột Description là “VIP” nếu tổng giá lớn hơn 1500 và “Normal” nếu tổng giá nhỏ hơn 1500(Gợi ý: Dùng UNION)
#select UnitPrice * Quantity, 'VIP' AS DESCRIPTION 
#from `Order Details`
#where UnitPrice * Quantity > 1500.0000
#union 
#select UnitPrice * Quantity, 'Normal' As Description 
#from `Order Details`
#where UnitPrice * Quantity < 1500.00000;

# 4) Xuất danh sách những hóa đơn (Id, OrderNumber, OrderDate)
# trong tháng 7 nhưng phải ngoại trừ ra những hóa đơn từ khách hàng France. (Gợi ý: dùng EXCEPT)
#select OrderID, OrderDate, ShipCountry
#from Orders
#where  Month(OrderDate) = 07 and ShipCountry != "France";
# 5) Xuất danh sách những hóa đơn (Id, OrderNumber, OrderDate, TotalAmount)  nào có TotalAmount nằm trong top 5 các hóa đơn. (Gợi ý : Dùng IN)
#select OrderID as Order_ID,OrderDate as Order_Date, Freight
#select * 
#from Orders 
#where Freight in (Select Freight from Orders group by Freight Order by Freight Desc)
#limit 5;