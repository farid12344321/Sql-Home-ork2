
CREATE DATABASE Course

USE Course


CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50),
	Point TINYINT
)
ALTER TABLE Students
ADD CONSTRAINT unique_email UNIQUE(Email)

ALTER TABLE Students
ADD CHECK(Point >= 0 AND Point <=100)





INSERT INTO Students
VALUES
('Cavid Ismayilzadeh','cavid@gmail.com',44),
('Shaiq Kazimov','shaiq@gmail.com',90),
('Elcan Qurbanov','elcan@gmail.com',10),
('Mubariz Aghayev','mubariz@gmail.com',100),
('Ibrahim Abdullayev','ibrahim@gmail.com',40),
('Samir Xancanov','samir@gmail.com',30)
SELECT*FROM Students

--Point dəyəri bütün tələbə pointlərinin ortalamasından böyük olan tələbəli select edən query--
SELECT AVG(Point) FROM Students

SELECT * FROM Students
WHERE Point>(SELECT AVG(Point) FROM Students)

--Students datalarını Id, Name,Point columnları kimi select edən query (burada fullname-i substring edib as Name kimi select edin)--
SELECT Id,SUBSTRING(FullName,1,CHARINDEX(' ',FullName)-1) AS Name,Point FROM Students


--Student datalarının email domainlərini (@-dən sonraki hissə) select edən query--
SELECT SUBSTRING(Email,CHARINDEX('@',Email)+1,-1) AS Domain FROM Students
