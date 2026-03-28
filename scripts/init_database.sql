/*
================================================================================
1. Create Database and Schemas (English Version)
================================================================================
Script Purpose:
    This script initializes the Data Warehouse environment. It creates a new 
    database named 'DataWarehouse' and sets up a Medallion Architecture 
    using three distinct schemas:
    
    - [bronze]: Stores raw, untouched data from source files.
    - [silver]: Stores cleaned and transformed data ready for modeling.
    - [gold]:   Stores final, business-ready data optimized for analytics.

WARNING:
    Running this script will DROP the entire 'DataWarehouse' database if it exists.
    All data will be PERMANENTLY DELETED. Proceed with caution and ensure you 
    have proper backups before execution.
--------------------------------------------------------------------------------
*/

USE master;
GO

-- Drop and recreate the DataWarehouse database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
