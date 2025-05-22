CREATE OR REPLACE FUNCTION public.get_yesno_constant(constant_name text)
 RETURNS yes_no
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result yes_no;
BEGIN
    -- Retrieve the constant record based on the given name
    SELECT yes_no_value INTO result
    FROM public.constants
    WHERE name = constant_name;

    -- Check if the constant record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Constant with name % not found', constant_name;
    END IF;

    return result;
END;
$function$ 