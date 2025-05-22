CREATE OR REPLACE FUNCTION public.get_numeric_constant(constant_name text)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result numeric;
BEGIN
    -- Retrieve the constant record based on the given name
    SELECT numeric_value INTO result
    FROM public.constants
    WHERE name = constant_name;

    -- Check if the constant record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Constant with name % not found', constant_name;
    END IF;

    return result;
END;
$function$ 