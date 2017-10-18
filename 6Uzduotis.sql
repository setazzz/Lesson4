CREATE TABLE IF NOT EXISTS `Authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `Authors` (`authorId`, `name`) VALUES
  (1, 'Chris Smith'),
  (2, 'Steven Levithan'),
  (3, ' Jan Goyvaerts'),
  (4, 'Ryan Benedetti'),
  (5, ' Al Anderson'),
  (6, 'Clay Breshears'),
  (7, 'Kevlin Henney');

CREATE TABLE IF NOT EXISTS `Books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

INSERT INTO `Books` (`bookId`, `authorId`, `title`, `year`) VALUES
  (1, 1, 'Programming F# 3.0, 2nd Edition', 2012),
  (2, 2, 'Regular Expressions Cookbook, 2nd Edition', 2012),
  (3, 4, 'Head First Networking', 2009),
  (4, 6, 'The Art of Concurrency', 2009),
  (5, 7, '97 Things Every Programmer Should Know', 2010),
  (6, NULL, 'McCullough and Berglund on Mastering Advanced Git', NULL),
  (7, NULL, 'Version Control with Git, 2nd Edition', 2012),
  (8, NULL, 'Learning Python, 4th Edition', 2009);

INSERT INTO Authors (name)
VALUES ('George R. R. Martin'),
  ('J. R. R. Tolkien'),
  ('L. Dartnel');

INSERT INTO Books (authorId, title, year)
VALUES (8, 'A Game Of Thrones', 1995),
  (9, 'Lord Of The Rings. The Fellowship of the Ring', 1954),
  (10, 'The Knowledge: How to Rebuild Our World from Scratch', 2015);

UPDATE Books SET authorId = 1 WHERE bookId = 5;

DELETE FROM Authors WHERE authorId BETWEEN 8 AND 10;

DELETE FROM Books WHERE authorId IS NULL;

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

CREATE TABLE `Books_Authors` (
  `bookId` INT NOT NULL,
  `authorId` INT NOT NULL
);

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

ALTER TABLE Books CONVERT TO CHARACTER SET utf8;
UPDATE Books SET title = 'Sostų karai' WHERE bookId = 9;
