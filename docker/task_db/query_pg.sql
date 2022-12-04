CREATE TABLE IF NOT EXISTS todo_list(
    id TEXT  NOT NULL,
    text TEXT  NOT NULL,
    status TEXT  NOT NULL 
);

INSERT INTO todo_list (id,text,status) 
VALUES ('1','test','done');

SELECT * FROM todo_list;