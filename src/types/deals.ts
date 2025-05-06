export type DealDisposition = "Active" | "Dead" | "On Hold";
export type DealStage1 = "Lead" | "Scenario" | "Deal";
export type DealStage2 =
  | "Loan Setup"
  | "Processing 1"
  | "Appraisal Review"
  | "Processing 2"
  | "QC 1"
  | "Underwriting"
  | "Conditionally Approved"
  | "QC 2"
  | "Clear to Close"
  | "Closed & Funded";
export type DealType = "RTL" | "DSCR";
export type DealProjectType =
  | "Fix and Flip"
  | "Ground Up"
  | "Rental"
  | "Stabilized Bridge";
export type DealTransactionType =
  | "Purchase"
  | "Delayed Purchase"
  | "Refinance Cash Out"
  | "Refinance Rate/Term";
export type DealLoanTerm =
  | "6"
  | "12"
  | "15"
  | "18"
  | "24"
  | "36"
  | "48"
  | "60"
  | "72"
  | "84"
  | "96"
  | "108"
  | "120"
  | "300"
  | "360";

export interface Deal {
  dealId: string;
  dealName: string;
  dealType: DealType;
  dealProjectType: DealProjectType;
  dealTransactionType: DealTransactionType;
  dealDisposition: DealDisposition;
  dealStage1: DealStage1;
  dealStage2: DealStage2;
  dealLoanNumber: string;
  dealLoanAmountTotal: number;
  dealConstructionHoldback: number;
  dealLoanAmountInitial: number;
  dealLoanTerm: DealLoanTerm;
  dealIoPeriod: number;
  dealNoteRate: number;
  dealNoteDate: string;
  dealFundingDate: string;
  description?: string;
  dealCreatedBy: string;
  dealCreatedAt: string;
  dealUpdatedAt: string;
}
