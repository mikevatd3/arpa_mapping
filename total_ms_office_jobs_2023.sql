SELECT pos.year,
       -- sum(pos.residence_jobs) num_jobs_residents_detroit,
       sum(pos.jobs) num_jobs_detroit,
       sum(pos.openings) num_openings_detroit,
       sum(pos.growth) num_new_jobs_detroit
FROM detroit_tech_employment.skills sk
JOIN detroit_tech_employment.skills_sought sr
    ON sk.id = sr.skill_id
JOIN detroit_tech_employment.occupation occ
    ON sr.occ_code = occ.code
JOIN detroit_tech_employment.positions pos
    ON pos.code = occ.code
WHERE sk.name = 'Microsoft Office'
AND sr.significance = 'common'
AND pos.geoid in (
    '86000US48201',
    '86000US48202',
    '86000US48203',
    '86000US48204',
    '86000US48205',
    '86000US48206',
    '86000US48207',
    '86000US48208',
    '86000US48209',
    '86000US48210',
    '86000US48211',
    '86000US48212',
    '86000US48213',
    '86000US48214',
    '86000US48215',
    '86000US48216',
    '86000US48217',
    '86000US48219',
    '86000US48221',
    '86000US48223',
    '86000US48224',
    '86000US48226',
    '86000US48227',
    '86000US48228',
    '86000US48233',
    '86000US48234',
    '86000US48235',
    '86000US48238',
    '86000US48243'
)
AND year = DATE '2023-01-01'
GROUP BY pos.year
ORDER BY year;


