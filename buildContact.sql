DROP TABLE IF EXISTS contact;

CREATE TABLE contact (
	contactID int PRIMARY KEY,
	name VARCHAR(50),
	company VARCHAR(30),
	email VARCHAR(50)
);

INSERT INTO contact VALUES
	(0, 'Bill Gates', 'Microsoft', 'bill@microsoft.com');
	
SELECT * FROM contact;