CREATE OR REPLACE FUNCTION public.ltv(transaction_type transaction_type, as_is_value numeric, purchase_price numeric, loan_amount numeric)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result NUMERIC;
BEGIN
    result := CASE
        WHEN transaction_type IN ('Refinance Rate/Term', 'Refinance Cash Out') THEN (100 * (loan_amount / as_is_value))
        WHEN purchase_price < as_is_value AND transaction_type IN ('Purchase', 'Delayed Purchase') THEN (100 * (loan_amount / purchase_price))
        WHEN purchase_price >= as_is_value AND transaction_type IN ('Purchase', 'Delayed Purchase') THEN (100 * (loan_amount / as_is_value))
    END;
    RETURN result;
END;
$function$ 