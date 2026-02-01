/*
=============================================================================
Quality Checks
=============================================================================
Script Purpose:
   This script perfoms various quality checks for data consistency, accuracy,
and standardization across the 'silver' schemas. It includes checks for:
  - Null or duplicate primary keys.
  - Unwanted spaces in string fields.
  - Data standardization and consistency.
  - Invalid date ranges and orders.
  - Data consistency between related files.

Usage Notes:
    - Run these checks after data loading Silver layer.
    - Investigate and resolve any discrepancies found during the checks.
=============================================================================
*/

-- ==========================================================================
-- Checking 'silver.crm_cust_info'
--===========================================================================
-- Check for NULL or duplicates in primay key
-- Expectation: No Results
SELECT
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check for unwanted spaces
--Expectations no results
SELECT 
  cst_key
FROM silver.crm_cust_info
WHERE cst_key!= TRIM(cst_key);

--Data Standardition & Consistency
SELECT DISTINCT
    cst_marital_status
FROM silver.crm_cust_info

-- ==========================================================================
-- Checking 'silver.crm_prod_info'
--===========================================================================
-- Check for NULL or duplicates in primay key
-- Expectation: No Results
SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

--Check for unwanted spaces
--Expectations no results
SELECT 
  prd_nm
FROM silver.crm_prd_info
WHERE prd_nm!= TRIM(prd_nm);

-- Checks for NULL or Negative values in cost
-- Expections: No Results
SELECT
  prd_cost
WHERE prd_cost < 0 OR prd_cost IS NULL;


--Data Standardition & Consistency
SELECT DISTINCT
    prd_line
FROM silver.crm_prod_info

-- Check for invalid Date Orders (Start date > End date)
-- Expectation: No results
 SELECT
   *
 FROM silver.crm_prod_info
 WHERE prd_end_dt<start_dt;
  

--==============================================
-- Checking silver.crm_sales_details
--=============================================
-- Check for invalid dates
-- Expectation: No Results
SELECT
    NULLIF(sls_due_dt, 0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
     OR LEN(sls_due_dt)!= 0
     OR sls_due_dt > 20500101
     OR sls_due_dt < 1900101

-- Check for invalid date orders (order date > shipping date)
-- Expectation: No results
SELECT
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
    OR sls_order_date > sls_due_dt;

-- Check for data consistency: Sales = Quantity * Time
-- Expectation: No Results
SELECT DISTINCT
     sls_sales,
     sls_quantity,
     sls_price,
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
  OR sls_sales IS NULL
  OR sls_quantity IS NULL
  OR sls_price IS NULL
  OR sls_sales <= 0
  OR sls_quantity <= 0
  OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

--==============================================
-- Checking silver.erp_cust_az12
--=============================================
  -- Identify Out-of-range Dates
  -- Expectation: Birthdates between 1924-01-01 and today
  SELECT DISTINCT
      bdate
  FROM silver.erp_cust_az101
  WHERE bdate < '1924-01-01'
      OR bdate > GETDATE();


--Data Standardition & Consistency
SELECT DISTINCT
    gen
FROM silver.erp_cust_az101;


--==============================================
-- Checking silver.erp_loc_a101
--=============================================
--Data Standardition & Consistency
SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101
ORDER BY cntry;


--==============================================
-- Checking silver.erp_px_cat_g1v2
--=============================================
--Check for unwanted spaces
--Expectations no results
SELECT 
  cst_key
FROM silver.erp_px_cat_g1v2
WHERE cat!=TRIM (cat)
    OR subcat != TRIM (subcat)
    OR maintainace != TRIM(maintainance)

-- Data Standardization & consistency
SELECT DISTINCT
    maintainance
FROM silver.erp_px_cat_g1v2
