--IF anything Exists then
--Delete first and load data inside Table
--Also Created Store Procedure For Future Use

--For load CRM data 
CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
	BEGIN TRY
		TRUNCATE TABLE [Bronze].[crm_cust_info]
		BULK INSERT [Bronze].[crm_cust_info]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );

		TRUNCATE TABLE [Bronze].[crm_prd_info]
		BULK INSERT [Bronze].[crm_prd_info]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );

		TRUNCATE TABLE [Bronze].[crm_sales_detailes]
		BULK INSERT [Bronze].[crm_sales_detailes]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );

		--For Load ERP data

		TRUNCATE TABLE [Bronze].[erp_cust_az12]
		BULK INSERT [Bronze].[erp_cust_az12]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );

		TRUNCATE TABLE [Bronze].[erp_loc_a101]
		BULK INSERT [Bronze].[erp_loc_a101]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );

		TRUNCATE TABLE [Bronze].[erp_px_cat_g1v2]
		BULK INSERT [Bronze].[erp_px_cat_g1v2]
		FROM 'C:\Users\userm\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
		   FIRSTROW = 2 ,
		   FIELDTERMINATOR = ',' ,
		   TABLOCK 
		   );
	   END TRY
	   BEGIN CATCH
			PRINT '==========================================' 
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
			PRINT 'Error Message' + ERROR_MESSAGE();
			PRINT '==========================================' 
	   END CATCH
END
