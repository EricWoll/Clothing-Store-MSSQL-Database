-- insert test values
USE [ClothingStore];
GO

INSERT INTO [Catagories](catagory_id, catagory_name)
	VALUES
	('becc5d5c1f', 'Men''s Pants'),
	('097ab2c0c2', 'Men''s Shorts'),
	('331fc11d72', 'Men''s Shirts'),
	('b9b388cbef', 'Men''s Suits'),
	('3735ed17ec', 'Men''s Jackets'),
	('bbdbf8880f', 'Women''s Pants'),
	('de9ab25da5', 'Women''s Shorts'),
	('2cc1e3c906', 'Women''s Shirts'),
	('dfb9815a3f', 'Women''s Dress'),
	('b4085c9d61', 'Women''s Jackets');

INSERT INTO [Products] (product_id, product_name, brand_name, base_price)
	VALUES
	('afaa9012c9', 'Standard Taper Fit Men''s Pants', 'Levi', 53.98),
	('a02ff627a0', 'Bermuda Shorts', 'Nordstrom', 59.99),
	('9e9a7289c5', 'Men''s Infinite Flex Chino Short', 'Calvin Klein', 46.99),
	('4a9268b45b', 'Women''s Live In Pocket Joggers', 'Nordstrom', 42.99),
	('dfd6e54dd3', 'Women''s Ribcage Shorts', 'Levi', 69.50),
	('b521a6226f', 'Women''s Asymmetrical Cowl Midi Dress', 'Forever21', 90.00);

INSERT INTO [Sizes] (size_id, size_code, price_multiplier)
	VALUES
	('404c7d3db6', 'S', 0),
	('5a06f3a071', 'M', 0.10),
	('56198dbeb3', 'L', 0.20);

INSERT INTO [Colors] (color_id, color_code, color_name, price_multiplier)
	VALUES
	('0bc3ce828e', 'FF0000' , 'Red', 0),
	('0beb8e1c03', 'FFA500' , 'Orange', 0),
	('9a748090c2', '0000FF' , 'Blue', 0),
	('0567e09dc7', 'FFFFFF' , 'White', 0),
	('3a6fd3d9be', '808080' , 'Gray', 0),
	('90f8710822', 'ADD8E6' , 'Light Blue', 0);

INSERT INTO [Item] (item_id, catagory_id, product_id, size_id, color_id)
	VALUES
	('f40aa6c8e9', 'becc5d5c1f', 'afaa9012c9', '404c7d3db6', '0bc3ce828e'), --m p
	('3647766b68', '097ab2c0c2', 'a02ff627a0', '404c7d3db6', '0beb8e1c03'), --m s
	('53e0b922fe', '097ab2c0c2', 'a02ff627a0', '5a06f3a071', '9a748090c2'), --m s
	('de50157c95', 'becc5d5c1f', 'afaa9012c9', '5a06f3a071', '0567e09dc7'), --m p
	('3547886da0', '097ab2c0c2', '9e9a7289c5', '56198dbeb3', '3a6fd3d9be'), --m s
	('5873a3f9de', 'bbdbf8880f', '4a9268b45b', '404c7d3db6', '90f8710822'), --w p
	('b83322b9ac', 'de9ab25da5', 'dfd6e54dd3', '404c7d3db6', '0bc3ce828e'), --w s
	('4fc3b755f3', 'dfb9815a3f', 'b521a6226f', '404c7d3db6', '0beb8e1c03'), --w d
	('eeb98eb641', 'de9ab25da5', 'dfd6e54dd3', '5a06f3a071', '9a748090c2'), --w s
	('ae140c8153', 'bbdbf8880f', '4a9268b45b', '5a06f3a071', '90f8710822'); --w p
GO

SELECT *
FROM [Cashier].[register];