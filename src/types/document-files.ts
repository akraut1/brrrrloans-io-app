export type DocumentStatus =
  | "approved"
  | "pending_review"
  | "pending_submission"
  | "pending_exception"
  | "rejected_items_needed"
  | "rejected_revisions_needed"
  | "rejected_signature_needed";

export type DocumentCategory =
  | "application"
  | "appraisal"
  | "assets"
  | "closing"
  | "credit_and_background"
  | "construction"
  | "environmental"
  | "experience"
  | "id"
  | "insurance"
  | "pricing"
  | "property"
  | "seasoning"
  | "servicing"
  | "title"
  | "entity";

export interface DocumentFile {
  id: number;
  created_at: string;
  name: string | null;
  public_notes: string | null;
  private_notes: string | null;
  status: DocumentStatus | null;
  category: DocumentCategory | null;
  deal_id: number | null;
  borrower_id: number | null;
  entity_id: number | null;
  property_id: number | null;
  guarantor_id: number | null;
  effective_date: string | null;
  expiration_date: string | null;
  is_required: boolean | null;
  uploaded_by: string | null;
  uploaded_at: string | null;
  file_url: string | null;
  file_size: number | null;
  file_type: string | null;
  file_path: string | null;
}
