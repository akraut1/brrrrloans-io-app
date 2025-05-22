-- Table: public.cba_requests_guarantors
CREATE TABLE public.cba_requests_guarantors (
  cba_request_id bigint NOT NULL,
  guarantor_id bigint NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT cba_requests_guarantors_pkey PRIMARY KEY (cba_request_id, guarantor_id)
); 