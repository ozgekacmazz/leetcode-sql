SELECT 
  machine_id,
  ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
  SELECT 
    a_start.machine_id,
    a_start.process_id,
    a_start.timestamp AS start_time,
    a_end.timestamp AS end_time
  FROM Activity a_start
  JOIN Activity a_end
    ON a_start.machine_id = a_end.machine_id
    AND a_start.process_id = a_end.process_id
    AND a_start.activity_type = 'start'
    AND a_end.activity_type = 'end'
) AS durations
GROUP BY machine_id;
