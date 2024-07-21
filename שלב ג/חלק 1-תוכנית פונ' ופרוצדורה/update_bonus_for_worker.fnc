create or replace function update_bonus_for_worker(p_workerid in number) 
return number 
is
  v_items_sold number := 0;
  v_bonus_amount number := 0;
begin
  -- Declare cursor for fetching worker details
  for r_worker in (select workerid from worker where workerid = p_workerid) loop
    -- Get the count of items sold by the worker
    select count(*)
    into v_items_sold
    from purchase p
    where p.workerid = r_worker.workerid;

    -- Determine bonus amount based on items sold
    case
      when v_items_sold > 5 then
        v_bonus_amount := 200;
      when v_items_sold > 4 then
        v_bonus_amount := 100;
      when v_items_sold > 3 then
        v_bonus_amount := 50;
      else
        v_bonus_amount := 0;  -- No bonus if less than or equal to 3 items sold
    end case;

    -- Update the bonus for the worker if applicable
    if v_bonus_amount > 0 then
      update worker
      set bonus = bonus + v_bonus_amount
      where workerid = r_worker.workerid;
    end if;

    -- Return the bonus amount awarded
    return v_bonus_amount;
  end loop;

  -- If no data found, return 0
  return 0;

exception
  when no_data_found then
    return 0;  -- Return 0 if no data found for worker ID
  when others then
    return -1; -- Return -1 for any other error
end update_bonus_for_worker;
/
