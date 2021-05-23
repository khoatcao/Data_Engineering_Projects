#1) 
# Sắp xếp sản phẩm tăng dần theo UnitPrice, và tìm 20% dòng có UnitPrice cao nhất (Lưu ý: Dùng ROW_NUMBER )

use ABC ;
#SELECT
#		ROW_NUMBER() OVER (ORDER BY UnitPrice ASC) as row_num,
#		ProductID, 
#		ProductName,
#		QuantityPerUnit  
#FROM Products
#limit 20;
# 2) 
#Với mỗi hóa đơn, xuất danh sách các sản phẩm, số lượng (Quantity) 
#và số phần trăm của sản phẩm đó trong hóa đơn. 
#(Gợi ý: ta lấy Quantity chia cho tổng Quantity theo hóa đơn * 100 + ‘%’. Dùng SUM … OVER) 
#select 
#	OrderID,  
#	CustomerID,
#    Freight*100/ (select sum(Freight) as F from Orders) as percent
#from Orders;

# 3) Xuất danh sách các nhà cung cấp kèm theo các cột USA, UK, France, Germany, Others. 
#Nếu nhà cung cấp nào thuộc các quốc gia  này thì ta đánh số 1 còn lại là 0 (Gợi ý: Tạo bảng tạm theo chiều dọc trước với
# tên nhà cung cấp và thuộc quốc gia USA, UK, France, Germany hay Others. Sau đó PIVOT bảng tạm này để tạo kết quả theo chiều ngang)
#select
#*  
#  #SupplierID,
  #Country
#from Suppliers

#where Country in ('USA','UK','France','Germany')
#create temporary table name_country 

#select
#	  s.Country, 
#      s.Country = 'USA' as USA, 
#      s.Country = 'UK' as UK, 
#      s.Country = 'France' as France,
#      s.Country = 'Germany' as Germany, 
#      s.Country not in ('USA','UK','France','Germany') as Others
#from Suppliers as s; 

#drop temporary table name_country;
#select * from name_country;
#select
#     S.SupplierID,
#     n.USA, 
#     n.UK, 
#     n.France,
#     n.Germany,
#     n.Others
     
     
     

#from Suppliers as S

#left join name_country as n 
#on S.Country = n.Country


# 4) 
#Xuất danh sách các hóa đơn gồm OrderNumber, OrderDate (format: dd mm yyyy), CustomerName, Address (format: “Phone: …… , City: …. and Country: ….”), 
#TotalAmount làm tròn không chữ số thập phân và đơn vị theo kèm là Euro) 
#select 
#o.OrderID,
#DATE_FORMAT(o.OrderDate, "%D %M %Y") as OrderDate,
#c.ContactName as CustomerName,
#concat(round(o.Freight,2),'€') 
#from Orders as o
#from Customers as c 
#left join Customers as c 

#on c.CustomerID = o.OrderID
#select * from Orders;

#5)Xuất danh sách các sản phẩm dưới dạng đóng gói bags.
# Thay đổi chữ bags thành ‘túi’ (Lưu ý: để dùng tiếng việt có dấu ta ghi chuỗi dưới dạng N’túi’) 
#select 
#     ProductID,
#     ProductName,
#     SupplierID,
#     UnitPrice,
#     Insert(QuantityPerUnit,POSITION('bottles' IN QuantityPerUnit),LENGTH('bottles'),'chai') AS Package
#from Products 
#where QuantityPerUnit like '%bottles%'
# 6) Xuất danh sách các khách hàng theo tổng số hóa đơn mà khách hàng đó có,
# sắp xếp theo thứ tự giảm dần của tổng số hóa đơn, 
# kèm theo đó là  các thông tin phân hạng DENSE_RANK và nhóm (chia thành 3 nhóm)
# (Gợi ý: dùng NTILE(3) để chia nhóm. 
##	 c.ContactName,
 #    c.CustomerID	
	 #avg(o.Freight)
#from Customers as c
#left join   Orders as o
#on c.CustomerID = o.OrderID 
#group by c.ContactName

#select 
#	COALESCE(SUM(o.Freight),0) as OverAmount

# 7) 
# Xếp hạng sản phẩm theo UnitPrice tăng dần, hạng xếp phải có thứ tự tăng đều và các sản phẩm có cùng UnitPrice thì cùng hạng
#select 
#     ProductID,
#     ProductName,
##    (Dense_Rank() over(order by UnitPrice ASC)) 
#from Products 
#from Orders as o

# 8) case when 
select 
     OrderID, 
     CustomerID,
     OrderDate,
     (case 
          Month(OrderDate)
          when 1 then 'Month 1'
          when 2 then 'Month 2'
          when 3 then 'Month 3'
          when 4 then 'Month 4'
          when 5 then 'Month 5'
          when 6 then 'Month 6'
          when 7 then 'Month 7'
          when 8 then 'Month 8'
         when 10 then 'Month 10'
          when 11 then 'Month 11'
         else 'Month 12'
       end
	) as OrderMonth
from Orders
