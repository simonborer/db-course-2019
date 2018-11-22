> port to mysql
>> stored procedures in mysql
> create user
> create view
> triggers
> backup and restore

DELIMITER //

CREATE PROCEDURE insert_bakery_item
(
	-- Don't you miss %TYPE?
	IN 	item_id INT,
	IN 	item_name VARCHAR(20),
	IN	price	DOUBLE,
	IN 	bakeing
)