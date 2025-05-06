-- Migration: Convert 'id' column in bs_investor_distribution_payments from UUID to BIGINT (INT8) with auto-increment

-- 1. Add a new BIGINT column with auto-increment
ALTER TABLE bs_investor_distribution_payments
ADD COLUMN id_new BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

-- 2. Copy data from old id to a backup column (if needed)
ALTER TABLE bs_investor_distribution_payments
ADD COLUMN old_id UUID;
UPDATE bs_investor_distribution_payments SET old_id = id;

-- 3. Drop the old UUID primary key constraint and column
ALTER TABLE bs_investor_distribution_payments DROP CONSTRAINT bs_investor_distribution_payments_pkey;
ALTER TABLE bs_investor_distribution_payments DROP COLUMN id;

-- 4. Rename the new column to 'id'
ALTER TABLE bs_investor_distribution_payments RENAME COLUMN id_new TO id;

-- 5. Set the new 'id' column as the primary key
ALTER TABLE bs_investor_distribution_payments ADD PRIMARY KEY (id);

-- 6. (Optional) Remove the backup column if not needed
-- ALTER TABLE bs_investor_distribution_payments DROP COLUMN old_id; 