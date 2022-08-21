-- Query 3

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from
(select `order`.*, customer.cus_gender, customer.cus_name from `order` inner join customer where `order`.cus_id=customer.cus_id having
`order`.ord_amount>=3000)
as t1 group by t1.cus_id) as t2 group by t2.cus_gender;


-- Query 4

select product.pro_name, `order`.* from `order`, supplier_pricing, product
where `order`.cus_id=2 and
`order`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;


-- Query 5

select supplier.* from supplier where supplier.supp_id in (1,2,4,5)
group by supplier.supp_id;


-- Query 6

select category.*, min(t3.min_price) as Min_Price,t3.pro_name from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;


-- Query 7

select product.PRO_ID, product.PRO_NAME from product inner join
(select SP.PRICING_ID, SP.PRO_ID from supplier_pricing as SP inner join 
(select PRICING_ID, ORD_DATE from `order` where ORD_DATE>"2021-10-05") as T1 on T1.PRICING_ID=SP.PRICING_ID) 
as T2 on product.PRO_ID=T2.PRO_ID ;



-- Query 8

select customer.cus_name,customer.cus_gender from customer
where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- Query 9

call new_procedure();
