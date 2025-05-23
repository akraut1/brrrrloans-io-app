-- Table: public.loan_price_saved
CREATE TABLE public.loan_price_saved (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  deal_id bigint NULL,
  loan_price_id bigint NULL,
  program public.loan_program NULL,
  rate numeric NULL,
  loan_price numeric NULL,
  pitia numeric NULL,
  dscr numeric NULL,
  buydown numeric NULL,
  term_sheet_link text NULL,
  row_index integer NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NULL
); 