declare
  cursor c_customers is
    select customerid
    from customer;
  
  cursor c_workers is
    select workerid
    from worker;
  
  v_customer_id customer.customerid%type;
  v_worker_id worker.workerid%type;
  v_bonus_awarded number;
  discount_info SYS_REFCURSOR;
begin
  -- Loop over customers and update discount
  open c_customers;
  loop
    fetch c_customers into v_customer_id;
    exit when c_customers%notfound;
    
    -- Call procedure to update customer discount
    update_customer_discount(v_customer_id, discount_info);
  end loop;
  close c_customers;
  
  -- Loop over workers and update bonus
  open c_workers;
  loop
    fetch c_workers into v_worker_id;
    exit when c_workers%notfound;
    
    -- Call function to update worker bonus
    v_bonus_awarded := update_bonus_for_worker(v_worker_id);
    
    -- Print bonus information for the worker
       --dbms_output.put_line('Worker ID ' || v_worker_id || ': Bonus awarded: ' || v_bonus_awarded);
  end loop;
  close c_workers;
end;


--select * from customer;

--select * from worker;
