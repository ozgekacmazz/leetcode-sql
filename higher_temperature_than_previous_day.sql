-- LeetCode SQL: Higher Temperature Than Previous Day
-- Açıklama: Önceki güne göre daha yüksek sıcaklıkta olan günlerin id'lerini döndürür.

SELECT 
  a.id 
FROM 
  weather a 
JOIN 
  weather b 
  ON a.recordDate = DATE_ADD(b.recordDate, INTERVAL 1 DAY)
WHERE 
  a.temperature > b.temperature;
