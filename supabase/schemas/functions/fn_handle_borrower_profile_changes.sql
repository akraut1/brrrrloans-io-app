CREATE OR REPLACE FUNCTION public.handle_borrower_profile_changes()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE contactid BIGINT;
BEGIN
    -- Locate the contact ID using `user_profile_id` instead of `borrower_profile_id`
    SELECT id INTO contactid 
    FROM contact 
    WHERE user_profile_id = NEW.id;  -- Ensure `user_profile_id` exists in the `contact` table

    -- Update deal table with new guarantor information
    UPDATE deal 
    SET guarantor_fico_score = NEW.fico_score_mid_actual, 
        guarantor_citizenship = NEW.citizenship, 
        guarantor_first_time_home_buyer = NEW.first_time_home_buyer, 
        guarantor_mortgage_debt = NEW.mortgage_debt
    WHERE primary_guarantor_id = contactid 
      AND deal.locked = false;

    RETURN NEW;
END;
$function$ 