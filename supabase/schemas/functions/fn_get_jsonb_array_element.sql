CREATE OR REPLACE FUNCTION public.get_jsonb_array_element(array_value jsonb, index integer)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
    RETURN (
        with elements as (
          with x as (
            select jsonb_array_elements_text(array_value) AS element) 
            select x.element, row_number() over() as element_index from x
          ) 
        select elements.element from elements where elements.element_index = index);
END;
$function$ 