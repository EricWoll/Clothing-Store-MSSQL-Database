USE [master];
GO
-- create database
CREATE DATABASE [ClothingStore]
 ON ( NAME = N'ClothingBrand', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ClothingBrand.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON ( NAME = N'ClothingBrand_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ClothingBrand_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO

USE [ClothingStore];
GO

-- create tables
CREATE TABLE [Catagories] (
	catagory_id			VARCHAR(10) PRIMARY KEY NOT NULL,
	catagory_name		VARCHAR(80),
	creation_date		DATETIME DEFAULT GETDATE() NOT NULL
)

CREATE TABLE [Products] (
	product_id			VARCHAR(10) PRIMARY KEY NOT NULL,
	product_name		VARCHAR(80),
	brand_name			VARCHAR(40),
	base_price			FLOAT NOT NULL,
	creation_date		DATETIME DEFAULT GETDATE() NOT NULL
)

CREATE TABLE [Sizes] (
	size_id				VARCHAR(10) PRIMARY KEY NOT NULL,
	size_code			VARCHAR(5),
	price_multiplier	FLOAT NOT NULL
)

CReate TABLE [Colors] (
	color_id			VARCHAR(10) PRIMARY KEY NOT NULL,
	color_code			VARCHAR(6),
	color_name			VARCHAR(30),
	price_multiplier	FLOAT NOT NULL
)

CREATE TABLE [Item] (
	item_id			VARCHAR(20) PRIMARY KEY NOT NULL,
	catagory_id		VARCHAR(10) FOREIGN KEY REFERENCES Catagories(catagory_id),
	product_id		VARCHAR(10) FOREIGN KEY REFERENCES Products(product_id) NOT NULL,
	size_id			VARCHAR(10) FOREIGN KEY REFERENCES Sizes(size_id),
	color_id		VARCHAR(10) FOREIGN KEY REFERENCES Colors(color_id),
	creation_date	DATETIME DEFAULT GETDATE() NOT NULL
)
GO


-- create item register view

CREATE SCHEMA [Cashier];
GO

CREATE VIEW [Cashier].[Register] AS
	SELECT
		catagory_name AS 'Catagory',
		brand_name AS 'Brand',
		product_name 'Product',
		FORMAT(SUM(base_price + base_price * s.price_multiplier + base_price * col.price_multiplier), 'c2') AS 'Price',
		size_code AS 'Size',
		color_name AS 'Color'
	FROM
		Item as i
			LEFT JOIN Catagories AS cat ON i.catagory_id = cat.catagory_id
			LEFT JOIN Products AS p ON i.product_id = p.product_id
			LEFT JOIN Sizes AS s ON i.size_id = s.size_id
			LEFT JOIN Colors as col ON i.color_id = col.color_id
	GROUP BY catagory_name, brand_name, product_name, size_code, color_name;
GO