CREATE OR REPLACE FUNCTION public.get_state_code(state_name text)
 RETURNS us_states
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$BEGIN
    state_name := LOWER(state_name); -- Convert input to lowercase
    CASE state_name
        WHEN 'alabama' THEN RETURN 'AL';
        WHEN 'alaska' THEN RETURN 'AK';
        WHEN 'arizona' THEN RETURN 'AZ';
        WHEN 'arkansas' THEN RETURN 'AR';
        WHEN 'california' THEN RETURN 'CA';
        WHEN 'colorado' THEN RETURN 'CO';
        WHEN 'connecticut' THEN RETURN 'CT';
        WHEN 'delaware' THEN RETURN 'DE';
        WHEN 'florida' THEN RETURN 'FL';
        WHEN 'georgia' THEN RETURN 'GA';
        WHEN 'hawaii' THEN RETURN 'HI';
        WHEN 'idaho' THEN RETURN 'ID';
        WHEN 'illinois' THEN RETURN 'IL';
        WHEN 'indiana' THEN RETURN 'IN';
        WHEN 'iowa' THEN RETURN 'IA';
        WHEN 'kansas' THEN RETURN 'KS';
        WHEN 'kentucky' THEN RETURN 'KY';
        WHEN 'louisiana' THEN RETURN 'LA';
        WHEN 'maine' THEN RETURN 'ME';
        WHEN 'maryland' THEN RETURN 'MD';
        WHEN 'massachusetts' THEN RETURN 'MA';
        WHEN 'michigan' THEN RETURN 'MI';
        WHEN 'minnesota' THEN RETURN 'MN';
        WHEN 'mississippi' THEN RETURN 'MS';
        WHEN 'missouri' THEN RETURN 'MO';
        WHEN 'montana' THEN RETURN 'MT';
        WHEN 'nebraska' THEN RETURN 'NE';
        WHEN 'nevada' THEN RETURN 'NV';
        WHEN 'new_hampshire' THEN RETURN 'NH';
        WHEN 'new_jersey' THEN RETURN 'NJ';
        WHEN 'new_mexico' THEN RETURN 'NM';
        WHEN 'new_york' THEN RETURN 'NY';
        WHEN 'north_carolina' THEN RETURN 'NC';
        WHEN 'north_dakota' THEN RETURN 'ND';
        WHEN 'ohio' THEN RETURN 'OH';
        WHEN 'oklahoma' THEN RETURN 'OK';
        WHEN 'oregon' THEN RETURN 'OR';
        WHEN 'pennsylvania' THEN RETURN 'PA';
        WHEN 'rhode_island' THEN RETURN 'RI';
        WHEN 'south_carolina' THEN RETURN 'SC';
        WHEN 'south_dakota' THEN RETURN 'SD';
        WHEN 'tennessee' THEN RETURN 'TN';
        WHEN 'texas' THEN RETURN 'TX';
        WHEN 'utah' THEN RETURN 'UT';
        WHEN 'vermont' THEN RETURN 'VT';
        WHEN 'virginia' THEN RETURN 'VA';
        WHEN 'washington' THEN RETURN 'WA';
        WHEN 'west_virginia' THEN RETURN 'WV';
        WHEN 'wisconsin' THEN RETURN 'WI';
        WHEN 'wyoming' THEN RETURN 'WY';
        ELSE RETURN NULL;
    END CASE;
END;$function$ 