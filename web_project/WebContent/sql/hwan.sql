update basket set BASKET_AMOUNT =10, BASKET_RESULT= (BASKET_ITEM_PRICE*10) 
where BASKET_MEMBER_ID = 'test123' and basket_num = 1;