select
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    c.c2 as CUSTOMERNAME,
    c.c3 as SEGMENT,
    c.c4 as COUNTRY,
    c.c1 as customerid,
    p.c1 as CATEGORY,
    p.c3 as PRODUCTNAME,
    p.C2 as productid,
    p.c4 as SUBCATEGORY
from {{ ref("raw_orders") }} as o
left join {{ ref("raw_customer") }} as c on o.customerid = c.c1
left join {{ ref("raw_product") }} as p on o.productid = p.c2
