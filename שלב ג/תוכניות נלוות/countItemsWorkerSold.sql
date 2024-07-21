declare
  cursor c_workers is
    select workerid, workerfname, workerlname
    from worker;
  
  r_worker c_workers%rowtype;
  v_items_sold number;
begin
  -- Open the cursor for workers
  open c_workers;
  
  loop
    fetch c_workers into r_worker;
    exit when c_workers%notfound;  -- Exit loop if no more workers
    
    -- Query to count items sold by the worker
    select count(*)
    into v_items_sold
    from purchase p
    where p.workerid = r_worker.workerid;

    -- Print worker ID and items sold
    dbms_output.put_line('ID: ' || r_worker.workerid || ', Items Sold: ' || v_items_sold);
    
  end loop;
  
  -- Close the cursor
  close c_workers;
  
exception
  when others then
    dbms_output.put_line('Error: ' || sqlerrm);
end;


--select * from customer;
