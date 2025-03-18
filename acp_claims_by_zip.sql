-- P:\2024_Projects\ARPA\Development\Workspace\Website Workspace - Esri Hub\Esri Hub Report Datasets\acp_households_by_zip_<date>.geojson

-- This file has the same structure as the 'households' file, including
-- the issue with filtering to Detroit.

WITH maxes AS (
    SELECT zipcode, max(data_month) max_date
    FROM acp_claims_by_zipcode
    group by zipcode
)
SELECT claims.zipcode,
       claims.claimed_subscribers,
       claims.claimed_devices,
       claims.claimed_service_support,
       claims.claimed_device_support,
       claims.total_claimed_support,
       dim_zip.geom
FROM acp_claims_by_zipcode claims
RIGHT JOIN maxes mx
    ON mx.zipcode = claims.zipcode
    AND mx.max_date = claims.data_month
LEFT JOIN dim_zip
  ON claims.zipcode = dim_zip.zipcode
-- WHERE claims.city_id = 128; -- Doesn't work as expected
