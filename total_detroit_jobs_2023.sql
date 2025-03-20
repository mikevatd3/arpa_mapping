SELECT sum(jobs) as total_detroit_positions
FROM detroit_tech_employment.positions
WHERE year = DATE '2023-01-01'
AND geoid in (
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
);
