--
-- Trečia užduotis
--

-- a)

INSERT INTO Authors (name)
    VALUES ('George R. R. Martin'),
           ('J. R. R. Tolkien'),
           ('L. Dartnel');

-- b)

INSERT INTO Books (authorId, title, year)
  VALUES (8, 'A Game Of Thrones', 1995),
         (9, 'Lord Of The Rings. The Fellowship of the Ring', 1954),
         (10, 'The Knowledge: How to Rebuild Our World from Scratch', 2015);

-- c

SELECT bookId, name AS 'author', title, year FROM Books
    LEFT JOIN (Authors) ON Books.authorId = Authors.authorId;

-- d)

UPDATE Books SET authorId = 1 WHERE bookId = 5;

-- e).1

SELECT Authors.name, count(Books.authorId) as NumberOfBooks FROM Authors
  LEFT JOIN Books ON Authors.authorId = Books.authorId
  GROUP BY Authors.authorId;

-- e).2

SELECT Authors.name, count(Books.authorId) as NumberOfBooks FROM Authors
  LEFT JOIN Books ON Authors.authorId = Books.authorId
  WHERE Books.authorId IS NOT NULL
  GROUP BY Authors.authorId;

-- f)

DELETE FROM Authors WHERE authorId BETWEEN 8 AND 10;

-- g)

DELETE FROM Books WHERE authorId IS NULL;
