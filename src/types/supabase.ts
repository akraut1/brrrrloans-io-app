export type Database = {
  public: {
    Tables: {
      deals: {
        Row: {
          id: string;
          created_at: string;
          updated_at: string;
          name: string;
          description: string | null;
          user_id: string;
          created_by: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name: string;
          description?: string | null;
          user_id: string;
          created_by?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name?: string;
          description?: string | null;
          user_id?: string;
          created_by?: string | null;
        };
      };
      distributions: {
        Row: {
          id: string;
          created_at: string;
          updated_at: string;
          name: string;
          description: string | null;
          user_id: string;
          deal_id: string;
        };
        Insert: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name: string;
          description?: string | null;
          user_id: string;
          deal_id: string;
        };
        Update: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name?: string;
          description?: string | null;
          user_id?: string;
          deal_id?: string;
        };
      };
      documents: {
        Row: {
          id: string;
          created_at: string;
          updated_at: string;
          name: string;
          description: string | null;
          user_id: string | null;
          document_user_id: string | null;
          deal_id: string | null;
          distribution_id: string | null;
          storage_path: string;
          category: string | null;
          file_type: string | null;
          file_size: number | null;
          file_url: string | null;
          upload_date: string | null;
          uploaded_by: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name: string;
          description?: string | null;
          user_id?: string | null;
          document_user_id?: string | null;
          deal_id?: string | null;
          distribution_id?: string | null;
          storage_path: string;
          category?: string | null;
          file_type?: string | null;
          file_size?: number | null;
          file_url?: string | null;
          upload_date?: string | null;
          uploaded_by?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name?: string;
          description?: string | null;
          user_id?: string | null;
          document_user_id?: string | null;
          deal_id?: string | null;
          distribution_id?: string | null;
          storage_path?: string;
          category?: string | null;
          file_type?: string | null;
          file_size?: number | null;
          file_url?: string | null;
          upload_date?: string | null;
          uploaded_by?: string | null;
        };
      };
      document_files: {
        Row: {
          id: string;
          created_at: string;
          updated_at: string;
          name: string;
          description: string | null;
          user_id: string | null;
          deal_id: string | null;
          distribution_id: string | null;
          storage_path: string;
          category: string | null;
          file_type: string | null;
          file_size: number | null;
          file_url: string | null;
          upload_date: string | null;
          uploaded_by: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name: string;
          description?: string | null;
          user_id?: string | null;
          deal_id?: string | null;
          distribution_id?: string | null;
          storage_path: string;
          category?: string | null;
          file_type?: string | null;
          file_size?: number | null;
          file_url?: string | null;
          upload_date?: string | null;
          uploaded_by?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string;
          updated_at?: string;
          name?: string;
          description?: string | null;
          user_id?: string | null;
          deal_id?: string | null;
          distribution_id?: string | null;
          storage_path?: string;
          category?: string | null;
          file_type?: string | null;
          file_size?: number | null;
          file_url?: string | null;
          upload_date?: string | null;
          uploaded_by?: string | null;
        };
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      [_ in never]: never;
    };
    Enums: {
      [_ in never]: never;
    };
  };
};

export type UserRole = "ADMIN" | "MANAGER" | "STAFF" | "USER";

export interface UserProfile {
  id: number;
  email: string | null;
  updated_at: string | null;
  username: string | null;
  first_name: string | null;
  last_name: string | null;
  full_name: string | null;
  avatar_url: string | null;
  website: string | null;
  role: UserRole | null;
  is_active_yn: boolean | null;
  deactivation_date: string | null;
  invitation_date: string | null;
  activated_date: string | null;
  cell_phone: string | null;
  office_phone_extension: string | null;
  is_internal_yn: boolean;
  office_phone: string | null;
}

export type Tables = {
  user_profile: {
    Row: UserProfile;
    Insert: Omit<UserProfile, "id" | "full_name" | "updated_at">;
    Update: Partial<Omit<UserProfile, "id" | "full_name" | "updated_at">>;
  };
  // ... existing code ...
};
