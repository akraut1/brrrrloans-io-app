CREATE OR REPLACE FUNCTION public.format_deal_name(property_id bigint)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    formatted_name text;
BEGIN
    SELECT 
        CONCAT_WS(', ', 
            p.address_street, 
            p.address_suite_apt, 
            p.address_city || ', ' || p.address_state || ' ' || p.address_postal_code
        )
    INTO formatted_name
    FROM public.property p
    WHERE p.id = property_id;

    RETURN formatted_name;
END;
$function$ 