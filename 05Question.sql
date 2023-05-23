select p.pro_id,p.PRO_NAME,o.ORD_DATE from product p
inner join supplier_pricing sp
on p.pro_id=sp.pro_id
inner join `order` o
on sp.PRICING_ID=o.PRICING_ID
where o.ORD_DATE>"2021-10-05"; 
