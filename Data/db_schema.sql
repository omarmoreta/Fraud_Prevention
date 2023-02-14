-- drop tables if they exist with cascade because they depend on each other
DROP TABLE IF EXISTS card_holder, credit_card, merchant_category, merchant, transaction CASCADE;

-- create card_holder table
CREATE TABLE card_holder (
	card_holder_id SERIAL NOT NULL,
    card_holder_name VARCHAR NOT NULL,
	PRIMARY KEY (card_holder_id)
);

-- copy csv data into card_holder table (needed to move all csv files to C:/User/Public because postgres does not have permission from repo)
COPY card_holder(card_holder_id, card_holder_name)
FROM 'C:\Users\Public\card_holder.csv'
DELIMITER ','
CSV HEADER;

-- check table was created and data copied successfully
-- SELECT * FROM card_holder;

-- create credit_card table
CREATE TABLE credit_card (
	card_number_id VARCHAR(20) NOT NULL,
 	card_holder_id INT NOT NULL,
	PRIMARY KEY (card_number_id),
	FOREIGN KEY (card_holder_id) 
	REFERENCES card_holder(card_holder_id)
);
 
-- copy csv data into credit_card table 
COPY credit_card(card_number_id, card_holder_id)
FROM 'C:\Users\Public\credit_card.csv'
DELIMITER ','
CSV HEADER;

-- check table was created and data copied successfully
-- SELECT * FROM credit_card;

-- create merchant_category table
CREATE TABLE merchant_category (
	merchant_category_id SERIAL NOT NULL,
 	merchant_category_name VARCHAR NOT NULL,
	PRIMARY KEY (merchant_category_id)
);
 
-- copy csv data into merchant_category table 
COPY merchant_category(merchant_category_id, merchant_category_name)
FROM 'C:\Users\Public\merchant_category.csv'
DELIMITER ','
CSV HEADER;

-- check table was created and data copied successfully
-- SELECT * FROM merchant_category;

-- create merchant table
CREATE TABLE merchant (
	merchant_id SERIAL NOT NULL,
 	merchant_name VARCHAR NOT NULL,
	merchant_category_id INT NOT NULL,
	PRIMARY KEY (merchant_id),
	FOREIGN KEY (merchant_category_id)
	REFERENCES merchant_category(merchant_category_id)
);
 
-- copy csv data into merchant table 
COPY merchant(merchant_id, merchant_name, merchant_category_id)
FROM 'C:\Users\Public\merchant.csv'
DELIMITER ','
CSV HEADER;

-- check table was created and data copied successfully
-- SELECT * FROM merchant;

-- create transaction table
CREATE TABLE transaction (
	transaction_id INT NOT NULL,
 	transaction_date TIMESTAMP NOT NULL,
	transaction_amount FLOAT NOT NULL,
	transaction_card_id VARCHAR(20) NOT NULL,
	transaction_merchant_id SERIAL NOT NULL,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (transaction_card_id)
	REFERENCES credit_card(card_number_id),
	FOREIGN KEY (transaction_merchant_id)
	REFERENCES merchant(merchant_id)
);
 
-- copy csv data into transaction table 
COPY transaction(transaction_id, transaction_date, transaction_amount, transaction_card_id, transaction_merchant_id)
FROM 'C:\Users\Public\transaction.csv'
DELIMITER ','
CSV HEADER;

-- check table was created and data copied successfully
-- SELECT * FROM transaction;
