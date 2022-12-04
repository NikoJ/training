CREATE DATABASE tl;

CREATE TABLE tl.todo_list(
	id String,
	text String,
	status String
) 
ENGINE = MergeTree() 
ORDER BY id;

INSERT INTO tl.todo_list(id, text, status) 
VALUES ('1','Купить молоко','active'),
('2','Купить сыр','active'),
('3','Купить масло','active'),
('4','Купить яйца','done'),
('5','Купить творог','done');

SELECT * 
FROM tl.todo_list
WHERE status = 'done';