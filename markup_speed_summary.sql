-- P:\2024_Projects\ARPA\Development\Workspace\Website Workspace - Esri Hub\Esri Hub Report Datasets\makrup_speed_summary_<date>.geojson

WITH zip_ags AS (
    SELECT zip_id,
           COUNT(*) num_plans,
           MIN(advertised_upload_speed) min_ad_upload_speed,
           PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY advertised_upload_speed) as median_ad_upload_speed,
           AVG(advertised_upload_speed) avg_ad_upload_speed,
           MAX(advertised_upload_speed) max_ad_upload_speed
    FROM markup_internet_speeds mis
    WHERE price = 55
    GROUP BY zip_id
)
-- 'COALESCE' fills with a default value if the first value is missing
-- in this case if no zipcode is found, it fills 'NO ZIP AVAILABLE.'
SELECT COALESCE(dim_zip.zipcode, 'NO ZIP AVAILABLE') as zip_code, 
       zip_ags.num_plans,
       zip_ags.min_ad_upload_speed,
       zip_ags.median_ad_upload_speed,
       zip_ags.avg_ad_upload_speed,
       zip_ags.max_ad_upload_speed,
       dim_zip.geom
FROM zip_ags
LEFT JOIN dim_zip
  ON zip_ags.zip_id = dim_zip.id;

