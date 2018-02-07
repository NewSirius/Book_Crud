USE test; 
DROP TABLE IF EXISTS book; 
CREATE TABLE book(
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(100) NOT NULL,
description varchar(255),
author varchar(100) NOT NULL,
isbn varchar(20) NOT NULL,
printYear int(11) NOT NULL,
readAlready tinyint(1) NOT NULL); 

INSERT INTO 
book 
VALUES
	(null, 'Book1', 'Book for Tests', 'Bruce Eckel', '978-5-388-00003-3', 2015, false),
	(null, 'Book2', 'Book for Tests', 'Kate Sierra', '978-5-699-54574-2', 2013, false),
    (null, 'Book3', 'Book for Tests', 'Robert Lafore', '978-5-496-00740-5', 2017, false),
    (null, 'Book4', 'Book for Tests', 'Gerbert Shildt', '978-5-8459-1918-2', 2017, false),
    (null, 'Book5', 'Book for Tests', 'Kris Shefer', '978-5-8459-1992-2', 2017, false),
    
	(null, 'Book6', 'Book for Tests', 'Bruce Eckel', '978-5-388-464603-3', 2015, false),
	(null, 'Book7', 'Book for Tests', 'Author3', '9-6765658-03-2', 2013, false),
    (null, 'Book8', 'Book for Tests', 'Author4', '4-345345435-897-6', 2015, false),
    (null, 'Book9', 'Book for Tests', 'Author5', '1-34543543-83-0', 2012, false),
    (null, 'Book10', 'Book for Tests','Author6', '1-34543-83-0', 2016, false),
    
    (null, 'Book11', 'Book for Tests', 'Author7',  '1-943876-83-0', 2012, false),
	(null, 'Book12', 'Book for Tests', 'Author8',  '7-123346-90-0', 2014, false),
    (null, 'Book13', 'Book for Tests', 'Author9', '6-464637-03-2', 2018, false),
    (null, 'Book14', 'Book for Tests', 'Author10', '7-34646-90-0', 2014, false),
    (null, 'Book15', 'Book for Tests', 'Author11', '6-6785875-03-2', 2013, false),
    
    (null, 'Book16', 'Book for Tests', 'Author12',  '0-123567-43-4', 2010, false),
	(null, 'Book17', 'Book for Tests', 'Author13',  '4-2831092-22-2', 2016, false),
    (null, 'Book18', 'Book for Tests', 'Author14', '0-34543-43-4', 2010, false),
    (null, 'Book19', 'Book for Tests', 'Author15', '4-234234-22-2', 2015, false),
    (null, 'Book20', 'Book for Tests', 'Author16', '0-464364643-43-4', 2014, false),
    
    (null, 'Book21', 'Book for Tests', 'Author17',  '5-6757672-22-8', 2017, false),
	(null, 'Book22', 'Book for Tests', 'Author18',  '9-00014777-00-7', 2016, false),
    (null, 'Book23', 'Book for Tests', 'Author19', '5-465646-22-8', 2015, false),
    (null, 'Book24', 'Book for Tests', 'Author20', '9-2344636-00-7', 2014, false),
    (null, 'Book25', 'Book for Tests', 'Author21', '5-235757-22-8', 2013, false);
    