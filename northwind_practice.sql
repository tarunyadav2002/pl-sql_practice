select * from orders where ship_country in ('USA','France') order by ship_country;

select count(*),ship_country from orders where ship_country in ('USA','France') 
group by ship_country
order by ship_country;

select * from orders where ship_country in ('Brazil','Mexico','Venezuela','Argentina') 
order by ship_country

select (unit_price * quantity) - discount from order_details order by 1 desc

select min(order_date),max(order_date) from orders

select count(*),category_name from products p 
inner join categories c on c.category_id = p.category_id
group by category_name
order by 1 desc

select product_id,product_name,units_in_stock,reorder_level
from products
where units_in_stock <= reorder_level
order by 4 desc

select avg(freight),ship_country 
from orders
group by ship_country
order by 1 desc
limit 5

select avg(freight),ship_country 
from orders
where order_date between ('1997-01-01') and ('1997-12-31')
group by ship_country
order by 1 desc
limit 5

select max(order_date) from orders

select 
*
from customers c left join orders o on o.customer_id = c.customer_id
where o.customer_id is null

select c.customer_id,sum((od.unit_price * od.quantity) - od.discount)
from customers as c join orders o on o.customer_id = c.customer_id
join order_details od on od.order_id = o.order_id
group by c.customer_id
order by 2 desc
limit 10

select * from order_details

select order_id,count(*)
from order_details
group by 1
order by 2 desc

QTY > 60

select order_id,quantity
from order_details
where
quantity>60
group by order_id,quantity
having count(*) >1 ###

select *,shipped_date,required_date from orders 
where shipped_date > required_date

--late orders,employee id,all orders 

with late_orders as
(
	select employee_id,count(*) as total_late_orders from orders 
    where shipped_date > required_date
	group by 1
),
all_orders as
(
	select employee_id,count(*) as total_orders
	from orders
	group by 1
)
select 
employees.employee_id,
employees.first_name,
all_orders.total_orders,
late_orders.total_late_orders
from employees join all_orders on all_orders.employee_id = employees.employee_id
join late_orders  on late_orders.employee_id = employees.employee_id
order by 4 desc

select country
from customers
union
select country
from suppliers
order by country

with countries_suppliers as
(
	select distinct country from suppliers
),
countries_customers as
(
	select distinct country from customers
)
select s.country as country_supplier,c.country as country_customer
from countries_suppliers as s full join countries_customers c
on s.country = c. country

with orders_by_country as
(
	select ship_country,order_id,order_date,
	row_number() over (partition by ship_country 
					   order by ship_country,order_date) country_row_number
	from orders
)
select ship_country,order_id,order_date from orders_by_country
where country_row_number = 1

















