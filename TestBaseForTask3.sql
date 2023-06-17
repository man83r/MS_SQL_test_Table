CREATE TABLE Products
(
	ID int NOT NULL IDENTITY,
	ProdName nvarchar(20) NOT NULL
)
GO

CREATE TABLE Categories
(
	ID int NOT NULL IDENTITY,
	CatName nvarchar(20) NOT NULL
)
GO

ALTER TABLE Products
ADD
PRIMARY KEY(ID)
GO

ALTER TABLE Categories
ADD
PRIMARY KEY(ID)
GO

CREATE TABLE Prod_Cat
(
	Product_ID INT NOT NULL FOREIGN KEY REFERENCES Products(ID),
	Category_ID INT NOT NULL FOREIGN KEY REFERENCES Categories(ID),
	PRIMARY KEY (Product_ID, Category_ID)
)
GO



INSERT Products
(ProdName)
VALUES
('Молоко'),	 --напитки, молочные
('Колбаса'), --мясные
('Сыр'),	 --молочные
('Сосиски'), --мясные
('Печенье'), --бакалея
('Лимонад'); --напитки
GO

INSERT Products
(ProdName)
VALUES
('Кактус');
GO

SELECT * FROM Products

INSERT Categories
(CatName)
VALUES
('напитки'),
('мясные'),
('бакалея'),
('молочные');
GO

SELECT * FROM Categories

INSERT Prod_Cat
(Product_ID, Category_ID)
VALUES
('1','1'),
('1','4'),
('2','2'),
('3','4'),
('4','2'),
('5','3'),
('6','1');
GO


SELECT * FROM Prod_Cat

SELECT Products.ProdName, Categories.CatName
FROM Products
LEFT JOIN Prod_Cat ON Products.ID = Prod_Cat.Product_ID
LEFT JOIN Categories ON Prod_Cat.Category_ID = Categories.ID;