-- Record SQL Queries here

--    1. All patients, and the family name of their provider
SELECT patients.*, providers.family_name FROM patients JOIN providers ON patients.provider_external_id = providers.external_id;
-- SELECT patients.id, providers.family_name FROM patients JOIN providers ON patients.provider_external_id = providers.external_id;

--    2. All providers and the count of their patients
SELECT providers.*, 
(SELECT COUNT(*) 
FROM patients WHERE patients.provider_external_id = providers.external_id) AS count
FROM providers;
-- SELECT providers.external_id, COUNT(patients.provider_external_id) AS count FROM providers
-- LEFT JOIN patients ON patients.provider_external_id = providers.external_id
-- GROUP BY providers.external_id;

--    3. All providers that don't have any patients
SELECT providers.*
FROM providers
WHERE providers.external_id NOT IN ( SELECT patients.provider_external_id FROM patients);

--    4. All providers and a count of all their patients over 55 years of age
SELECT providers.*,
(SELECT COUNT(*) 
FROM patients WHERE patients.provider_external_id = providers.external_id AND date_of_birth < now() - '55 years'::interval) 
FROM providers;