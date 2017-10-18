--
-- Uždaviniai
--

-- 1.

SELECT count(DISTINCT userId) FROM UserClicks
  WHERE year(dateTime) = year(now());

-- 2.

SELECT clientId, (YEAR(NOW()) - YEAR(birthDate)) AS age FROM Clients
  WHERE DAY(birthDate) = DAY(NOW())
    AND MONTH(birthDate) = MONTH(NOW());

-- 3.

SELECT News.*,
  (SELECT text
   FROM Comments
   WHERE newsId = News.newsId
   ORDER BY date DESC LIMIT 1 )
from News
ORDER BY News.date DESC limit 10;