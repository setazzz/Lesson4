--
-- Ketvirta užduotis
--

-- a)

ALTER TABLE Books ADD genre VARCHAR(255);

UPDATE Books
  SET genre = 'Programming books'
  WHERE bookId BETWEEN 1 AND 5;

UPDATE Books
  SET genre = 'Fantasy'
  WHERE bookId IN (9, 10);

UPDATE Books
  SET genre = 'Philosophy'
  WHERE bookId = 11;

-- b)

CREATE TABLE `Books_Authors` (
  `bookId` INT NOT NULL,
  `authorId` INT NOT NULL
);

-- c)

ALTER TABLE Books DROP COLUMN authorId;

INSERT INTO `Books_Authors` (`bookId`, `authorId`) VALUES
  (1, 1),
  (2, 2),
  (3, 4),
  (4, 6),
  (5, 1),
  (6, 5),
  (7, 2),
  (8, 1),
  (1, 2),
  (1, 3),
  (2, 3);

-- d)

SELECT Books.bookId, Books.title, GROUP_CONCAT(Authors.name) AS 'Author/-s'
FROM Books
  INNER  JOIN Books_Authors
    ON Books.bookId = Books_Authors.bookId
  INNER JOIN Authors
    ON Books_Authors.authorId = Authors.authorId
GROUP BY Books.bookId;

-- e)

ALTER TABLE Books CONVERT TO CHARACTER SET utf8;
UPDATE Books SET title = 'Sostų karai' WHERE bookId = 9;
