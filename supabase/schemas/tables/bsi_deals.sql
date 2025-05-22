-- Table: public.bs_investor_deals
CREATE TABLE public.bsi_deals (
  contact_id bigint NOT NULL,
  contact_types_id bigint NOT NULL,
  deal_id bigint NOT NULL,
  CONSTRAINT bsi_deals_pkey PRIMARY KEY (contact_id, contact_types_id, deal_id)
); 