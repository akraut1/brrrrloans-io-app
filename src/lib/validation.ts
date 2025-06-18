import type { Enums } from "@/types/supabase";

// Common validation patterns
export const ValidationPatterns = {
  amount: /^\d+(\.\d{1,2})?$/,
  percentage: /^\d+(\.\d{1,2})?$/,
  email: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
  phone: /^\+?[\d\s\-\(\)]{10,}$/,
  postalCode: /^[\d\w\s\-]{3,10}$/,
} as const;

// Valid enums for validation
export const ValidCategories: readonly Enums<"document_category">[] = [
  "application",
  "appraisal", 
  "assets",
  "closing",
  "credit_and_background",
  "construction",
  "environmental",
  "experience",
  "id",
  "insurance",
  "pricing",
  "property",
  "seasoning",
  "servicing",
  "title",
  "entity",
] as const;

export const ValidDocumentStatuses: readonly Enums<"document_status">[] = [
  "approved",
  "pending_review",
  "pending_submission", 
  "pending_exception",
  "rejected_items_needed",
  "rejected_revisions_needed",
  "rejected_signature_needed",
] as const;

// Validation functions
export function validateRequired(value: unknown, fieldName: string): string {
  if (value === null || value === undefined || value === "") {
    throw new Error(`${fieldName} is required`);
  }
  if (typeof value !== "string") {
    throw new Error(`${fieldName} must be a string`);
  }
  return value;
}

export function validateString(
  value: unknown, 
  fieldName: string, 
  options: { 
    minLength?: number; 
    maxLength?: number; 
    pattern?: RegExp;
    required?: boolean;
  } = {}
): string | null {
  const { minLength = 0, maxLength = Infinity, pattern, required = true } = options;
  
  if (!required && (value === null || value === undefined || value === "")) {
    return null;
  }
  
  if (required) {
    validateRequired(value, fieldName);
  }
  
  const stringValue = value as string;
  const trimmed = stringValue.trim();
  
  if (trimmed.length < minLength) {
    throw new Error(`${fieldName} must be at least ${minLength} characters`);
  }
  
  if (trimmed.length > maxLength) {
    throw new Error(`${fieldName} must be no more than ${maxLength} characters`);
  }
  
  if (pattern && !pattern.test(trimmed)) {
    throw new Error(`${fieldName} format is invalid`);
  }
  
  return trimmed;
}

export function validateNumber(
  value: unknown,
  fieldName: string,
  options: {
    min?: number;
    max?: number;
    integer?: boolean;
    required?: boolean;
  } = {}
): number | null {
  const { min = -Infinity, max = Infinity, integer = false, required = true } = options;
  
  if (!required && (value === null || value === undefined || value === "")) {
    return null;
  }
  
  let numericValue: number;
  
  if (typeof value === "string") {
    numericValue = integer ? parseInt(value, 10) : parseFloat(value);
  } else if (typeof value === "number") {
    numericValue = value;
  } else {
    throw new Error(`${fieldName} must be a number`);
  }
  
  if (isNaN(numericValue)) {
    throw new Error(`${fieldName} must be a valid number`);
  }
  
  if (numericValue < min) {
    throw new Error(`${fieldName} must be at least ${min}`);
  }
  
  if (numericValue > max) {
    throw new Error(`${fieldName} must be no more than ${max}`);
  }
  
  return numericValue;
}

export function validateEnum<T extends string>(
  value: unknown,
  fieldName: string,
  validValues: readonly T[],
  required: boolean = true
): T | null {
  if (!required && (value === null || value === undefined || value === "")) {
    return null;
  }
  
  if (typeof value !== "string") {
    throw new Error(`${fieldName} must be a string`);
  }
  
  if (!validValues.includes(value as T)) {
    throw new Error(`${fieldName} must be one of: ${validValues.join(", ")}`);
  }
  
  return value as T;
}

export function validateDate(
  value: unknown,
  fieldName: string,
  required: boolean = true
): string | null {
  if (!required && (value === null || value === undefined || value === "")) {
    return null;
  }
  
  if (typeof value !== "string") {
    throw new Error(`${fieldName} must be a string`);
  }
  
  if (isNaN(Date.parse(value))) {
    throw new Error(`${fieldName} must be a valid date`);
  }
  
  return value;
}

export function validateFileSize(
  size: unknown,
  fieldName: string = "File size",
  maxSizeBytes: number = 52428800 // 50MB default
): number {
  const sizeNum = validateNumber(size, fieldName, {
    min: 1,
    max: maxSizeBytes,
    integer: true,
  });
  
  if (sizeNum === null) {
    throw new Error(`${fieldName} is required`);
  }
  
  return sizeNum;
}

export function validateUrl(
  value: unknown,
  fieldName: string,
  required: boolean = true
): string | null {
  const urlString = validateString(value, fieldName, { required });
  
  if (!urlString) {
    return null;
  }
  
  try {
    new URL(urlString);
    return urlString;
  } catch {
    throw new Error(`${fieldName} must be a valid URL`);
  }
}

// Specialized validators for domain entities
export function validateDealData(formData: FormData) {
  return {
    name: validateString(formData.get("name"), "Deal name", { 
      minLength: 1, 
      maxLength: 255 
    }),
    type: validateString(formData.get("type"), "Deal type", { 
      minLength: 1, 
      maxLength: 100 
    }),
    amount: validateString(formData.get("amount"), "Amount", { 
      pattern: ValidationPatterns.amount 
    }),
    location: validateString(formData.get("location"), "Location", { 
      minLength: 1, 
      maxLength: 255 
    }),
    description: validateString(formData.get("description"), "Description", { 
      required: false, 
      maxLength: 1000 
    }),
    roi: validateString(formData.get("roi"), "ROI", { 
      pattern: ValidationPatterns.percentage 
    }),
    startDate: validateDate(formData.get("startDate"), "Start date"),
    status: validateString(formData.get("status"), "Status", { 
      required: false 
    }) ?? "Active",
  };
}

export function validateDocumentData(formData: FormData) {
  return {
    name: validateString(formData.get("name"), "Document name", { 
      minLength: 1, 
      maxLength: 255 
    }),
    category: validateEnum(
      formData.get("category"), 
      "Category", 
      ValidCategories
    ),
    fileUrl: validateUrl(formData.get("file_url"), "File URL"),
    fileSize: validateFileSize(formData.get("file_size")),
    fileType: validateString(formData.get("file_type"), "File type", { 
      minLength: 1, 
      maxLength: 100 
    }),
    filePath: validateString(formData.get("file_path"), "File path", { 
      required: false 
    }),
    dealId: validateNumber(formData.get("deal_id"), "Deal ID", { 
      min: 1, 
      integer: true, 
      required: false 
    }),
    borrowerId: validateNumber(formData.get("borrower_id"), "Borrower ID", { 
      min: 1, 
      integer: true, 
      required: false 
    }),
    guarantorId: validateNumber(formData.get("guarantor_id"), "Guarantor ID", { 
      min: 1, 
      integer: true, 
      required: false 
    }),
    entityId: validateNumber(formData.get("entity_id"), "Entity ID", { 
      min: 1, 
      integer: true, 
      required: false 
    }),
    propertyId: validateNumber(formData.get("property_id"), "Property ID", { 
      min: 1, 
      integer: true, 
      required: false 
    }),
    isRequired: formData.get("is_required") === "true",
    status: validateEnum(
      formData.get("status"), 
      "Status", 
      ValidDocumentStatuses, 
      false
    ),
  };
}