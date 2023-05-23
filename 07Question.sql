select s.SUPP_NAME,sp_ro_2.*,
case
when AverageRating=5 then 'Excellent Service'
when AverageRating>4 then 'Good Service'
when AverageRating >2 then 'Average Service'
else 'Poor service'
end as 'Type of Service'
from supplier s inner join
(select supp_id,avg(RAT_RATSTARS) as AverageRating from(
select sp.SUPP_ID,ro.ord_id,ro.rat_ratstars from supplier_pricing sp inner join(
select o.ord_id,o.pricing_id,r.RAT_RATSTARS from  `order` o inner join rating r
on o.ord_id=r.ord_id)as ro
on sp.pricing_id=ro.pricing_id)as sp_ro
group by supp_id)
as sp_ro_2 
on s.SUPP_ID=sp_ro_2.SUPP_ID;

=========================================================================================

procedure creation -'displaysupplierdetails'

========================================================

call displaysupplierdetails();
