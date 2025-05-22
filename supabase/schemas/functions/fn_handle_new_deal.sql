CREATE OR REPLACE FUNCTION public.handle_new_deal()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$declare 
  program_a_id int8;
  program_b_id int8;
begin

  insert into loan_program_a (loan_amount)
  values (0)
  returning id into program_a_id;

  insert into loan_program_b (loan_amount)
  values (0)
  returning id into program_b_id;

  NEW.program_a_id := program_a_id;
  NEW.program_b_id := program_b_id;
  return NEW;
end;$function$ 