CREATE OR REPLACE FUNCTION public.handle_new_loan_application()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  guarantor_count int;
  company_member_count int;
  company_member_borrower_id int;
  company_member_company_id int;
  company_member_guarantor_index text;
  counter int;
  new_deal_id bigint;
  new_company_id bigint;
  new_primary_borrower_id bigint;
  new_second_borrower_id bigint;
  new_third_borrower_id bigint;
  new_fourth_borrower_id bigint;
  new_primary_guarantor_id bigint;
  new_second_guarantor_id bigint;
  new_third_guarantor_id bigint;
  new_fourth_guarantor_id bigint;
  new_property_id bigint;
  submission_data JSONB;
BEGIN
  submission_data := NEW.submission::JSONB;
  BEGIN
  -- Create the property
    new_property_id := create_property_from_submission(submission_data);

  -- Create the deal
    new_deal_id := create_deal_from_submission(submission_data, new_property_id);

  -- Create the borrowers and set them as guarantors on the deal
    guarantor_count := CAST(NULLIF(submission_data->>'numberGuarantors', '') AS numeric);
    IF guarantor_count > 0 THEN
      new_primary_borrower_id = create_submission_borrower(
        submission_data->>'primaryGuarantorFirstName',
        submission_data->>'primaryGuarantorMiddleName',
        submission_data->>'primaryGuarantorLastName',
        submission_data->>'primaryGuarantorEmail',
        submission_data->>'primaryGuarantorCellPhone',
        submission_data->>'primaryGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'primaryGuarantorCitizenship', '') AS citizenship),
        submission_data->>'primaryGuarantorSSN',
        TO_DATE(submission_data->>'primaryGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'primaryGuarantorAddress',
        submission_data->>'primaryGuarantorAddressLine2',
        submission_data->>'primaryGuarantorCity',
        CAST(NULLIF(submission_data->>'primaryGuarantorState', '') AS us_states_long),
        submission_data->>'primaryGuarantorPostalCode',
        submission_data->>'primaryGuarantorCounty',
        submission_data->>'primaryGuarantorCountry',
        CAST(NULLIF(submission_data->>'primaryGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'primaryGuarantorExperienced' as yes_no)
      );

      new_primary_guarantor_id = create_submission_guarantor(new_deal_id, new_primary_borrower_id, 
        submission_data->>'primaryGuarantorFirstName',
        submission_data->>'primaryGuarantorMiddleName',
        submission_data->>'primaryGuarantorLastName',
        submission_data->>'primaryGuarantorEmail',
        submission_data->>'primaryGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 1 THEN
      new_second_borrower_id = create_submission_borrower(
        submission_data->>'secondGuarantorFirstName',
        submission_data->>'secondGuarantorMiddleName',
        submission_data->>'secondGuarantorLastName',
        submission_data->>'secondGuarantorEmail',
        submission_data->>'secondGuarantorCellPhone',
        submission_data->>'secondGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'secondGuarantorCitizenship', '') AS citizenship),
        submission_data->>'secondGuarantorSSN',
        TO_DATE(submission_data->>'secondGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'secondGuarantorAddress',
        submission_data->>'secondGuarantorAddressLine2',
        submission_data->>'secondGuarantorCity',
        CAST(NULLIF(submission_data->>'secondGuarantorState', '') AS us_states_long),
        submission_data->>'secondGuarantorPostalCode',
        submission_data->>'secondGuarantorCounty',
        submission_data->>'secondGuarantorCountry',
        CAST(NULLIF(submission_data->>'secondGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'secondGuarantorExperienced' as yes_no)
      );

      new_second_guarantor_id = create_submission_guarantor(new_deal_id, new_second_borrower_id, 
        submission_data->>'secondGuarantorFirstName',
        submission_data->>'secondGuarantorMiddleName',
        submission_data->>'secondGuarantorLastName',
        submission_data->>'secondGuarantorEmail',
        submission_data->>'secondGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 2 THEN
      new_third_borrower_id = create_submission_borrower(
        submission_data->>'thirdGuarantorFirstName',
        submission_data->>'thirdGuarantorMiddleName',
        submission_data->>'thirdGuarantorLastName',
        submission_data->>'thirdGuarantorEmail',
        submission_data->>'thirdGuarantorCellPhone',
        submission_data->>'thirdGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'thirdGuarantorCitizenship', '') AS citizenship),
        submission_data->>'thirdGuarantorSSN',
        TO_DATE(submission_data->>'thirdGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'thirdGuarantorAddress',
        submission_data->>'thirdGuarantorAddressLine2',
        submission_data->>'thirdGuarantorCity',
        CAST(NULLIF(submission_data->>'thirdGuarantorState', '') AS us_states_long),
        submission_data->>'thirdGuarantorPostalCode',
        submission_data->>'thirdGuarantorCounty',
        submission_data->>'thirdGuarantorCountry',
        CAST(NULLIF(submission_data->>'thirdGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'thirdGuarantorExperienced' as yes_no)
      );

      new_third_guarantor_id = create_submission_guarantor(new_deal_id, new_third_borrower_id, 
        submission_data->>'thirdGuarantorFirstName',
        submission_data->>'thirdGuarantorMiddleName',
        submission_data->>'thirdGuarantorLastName',
        submission_data->>'thirdGuarantorEmail',
        submission_data->>'thirdGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 3 THEN
      new_fourth_borrower_id = create_submission_borrower(
        submission_data->>'fourthGuarantorFirstName',
        submission_data->>'fourthGuarantorMiddleName',
        submission_data->>'fourthGuarantorLastName',
        submission_data->>'fourthGuarantorEmail',
        submission_data->>'fourthGuarantorCellPhone',
        submission_data->>'fourthGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'fourthGuarantorCitizenship', '') AS citizenship),
        submission_data->>'fourthGuarantorSSN',
        TO_DATE(submission_data->>'fourthGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'fourthGuarantorAddress',
        submission_data->>'fourthGuarantorAddressLine2',
        submission_data->>'fourthGuarantorCity',
        CAST(NULLIF(submission_data->>'fourthGuarantorState', '') AS us_states_long),
        submission_data->>'fourthGuarantorPostalCode',
        submission_data->>'fourthGuarantorCounty',
        submission_data->>'fourthGuarantorCountry',
        CAST(NULLIF(submission_data->>'fourthGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'fourthGuarantorExperienced' as yes_no)
      );

      new_fourth_guarantor_id = create_submission_guarantor(new_deal_id, new_fourth_borrower_id, 
        submission_data->>'fourthGuarantorFirstName',
        submission_data->>'fourthGuarantorMiddleName',
        submission_data->>'fourthGuarantorLastName',
        submission_data->>'fourthGuarantorEmail',
        submission_data->>'fourthGuarantorCellPhone'
      );
    END IF;


    IF submission_data->>'vestingEntityType' = 'Entity' THEN
      new_company_id := create_company_from_submission(submission_data);
      company_member_count := submission_data->>'numberCompanyMembers';

      IF new_company_id IS NOT NULL AND company_member_count > 0 THEN 
        counter := 1;

        WHILE counter <= company_member_count LOOP
          
          company_member_company_id := null;
          company_member_borrower_id := null;
          company_member_guarantor_index := null;

          IF get_jsonb_array_element(submission_data->'companyOwnerType', counter) = 'Entity' THEN
          -- get the company member type, if company, create a company and get the id. 
          insert into company (co_name, co_entity_type, co_ein, co_ppb_address_street, co_ppb_address_suite_apt,
            co_ppb_address_city, co_ppb_address_state_long, co_ppb_address_postal_code, co_ppb_address_country, co_role)
            values(
              get_jsonb_array_element(submission_data->'companyOwnerEntityName', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerEntityType', counter) AS entity_type),
              get_jsonb_array_element(submission_data->'companyOwnerEIN', counter),
              get_jsonb_array_element(submission_data->'companyOwnerStreetAddress', counter),
              get_jsonb_array_element(submission_data->'companyOwnerAddressLine2', counter),
              get_jsonb_array_element(submission_data->'companyOwnerCity', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerState', counter) AS us_states_long),
              get_jsonb_array_element(submission_data->'companyOwnerPostalCode', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerCountry', counter) AS country_enum),
              'Borrowing Entity'::company_role
            )
          returning co_id into company_member_company_id;
         
          ELSE
          -- if individual, check if is guarantor. if so get the guarantor number 
            IF get_jsonb_array_element(submission_data->'companyOwnerIsGuarantor', counter) = 'Yes' THEN
              company_member_guarantor_index := split_part(
                get_jsonb_array_element(submission_data->'companyOwnerGuarantorId', counter), ':', 1);
              company_member_borrower_id := CASE company_member_guarantor_index
                                              WHEN '1' THEN new_primary_borrower_id
                                              WHEN '2' THEN new_second_borrower_id
                                              WHEN '3' THEN new_third_borrower_id
                                              WHEN '4' THEN new_fourth_borrower_id
                                              ELSE null
                                            END;
            ELSE
              insert into borrower (first_name, middle_name, last_name, email_address, cell_phone, social_security_number,
                primary_residence_address_street, primary_residence_address_suite_apt, primary_residence_address_city, primary_residence_address_state_long, primary_residence_address_postal_code, primary_residence_address_country)
              values(
                get_jsonb_array_element(submission_data->'companyOwnerFirstName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerMiddleName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerLastName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerEmail', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCellPhone', counter),
                get_jsonb_array_element(submission_data->'companyOwnerTaxId', counter),
                get_jsonb_array_element(submission_data->'companyOwnerStreetAddress', counter),
                get_jsonb_array_element(submission_data->'companyOwnerAddressLine2', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCity', counter),
                CAST(get_jsonb_array_element(submission_data->'companyOwnerState', counter) AS us_states_long),
                get_jsonb_array_element(submission_data->'companyOwnerPostalCode', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCountry', counter)
              )
              returning id into company_member_borrower_id;
            END IF;
          END IF;
          -- create the member with the appropriate ids
          insert into company_member (member_company_id, 
            --member_name, 
            member_ownership_percentage, member_title, 
            member_borrower_id, member_owning_company_id, member_type, member_name_first, member_name_last, member_is_guarantor)
          values(
            new_company_id,
            --get_jsonb_array_element(submission_data->'companyOwnerName', counter),
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerOwnership', counter), '') AS double precision)/100,
            get_jsonb_array_element(submission_data->'companyOwnerTitle', counter),
            company_member_borrower_id,
            company_member_company_id,
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerType', counter), '') AS vesting_type),
            get_jsonb_array_element(submission_data->'companyOwnerFirstName', counter),
            get_jsonb_array_element(submission_data->'companyOwnerLastName', counter),
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerIsGuarantor', counter), '') AS yes_no)
          );
          counter := counter + 1;
        END LOOP;
      END IF;

    END IF;

    -- update the deal with the parties
    UPDATE deal SET
      company_id = new_company_id,
      primary_guarantor_id = new_primary_guarantor_id,
      second_guarantor_id = new_second_guarantor_id,
      third_guarantor_id = new_third_guarantor_id,
      fourth_guarantor_id = new_fourth_guarantor_id
    WHERE id = new_deal_id;
    
    IF new_deal_id IS NOT NULL THEN
      UPDATE loan_application SET 
        application_deal_id = new_deal_id,
        status = 'DEAL CREATED',
        reprocess = false 
      WHERE id = NEW.id;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      UPDATE loan_application SET 
        status = 'ERROR',
        reprocess = false , 
        error_message = SQLERRM 
      WHERE id = NEW.id;
      RAISE LOG 'Error processing loan application submission: %', SQLERRM;
  END;
  RETURN NEW;
END;
$function$ 