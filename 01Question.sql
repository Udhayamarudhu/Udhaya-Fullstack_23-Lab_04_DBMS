select count(CUS_NAME)as 'Total customers',CUS_GENDER from(
select * from(
select c.CUS_NAME,c.CUS_GENDER,o.* from customer c
 inner join
 `order` o 
 on c.CUS_ID=o.CUS_ID
 where o.ord_amount>=3000
)as co
 group by co.cus_id
)as co2
 group by co2.cus_gender;
