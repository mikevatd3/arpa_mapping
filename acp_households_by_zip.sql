-- Not all zipcodes have the same date for most recent data
-- this finds the individual 'max_dates' and then filters them to
-- the end
WITH maxes AS (
    SELECT zipcode, max(data_month) max_date
    FROM acp_households_by_zipcode
    group by zipcode
)
SELECT hhs.zipcode,
       hhs.net_new_enroll_total,
       hhs.total_subscribers,
       dim_zip.geom
FROM acp_households_by_zipcode hhs
RIGHT JOIN maxes mx
    ON mx.zipcode = hhs.zipcode
    AND mx.max_date = hhs.data_month
LEFT JOIN dim_zip
  ON hhs.zipcode = dim_zip.zipcode;
