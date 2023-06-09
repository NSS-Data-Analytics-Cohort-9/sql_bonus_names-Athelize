-- ## SQL Names Starter

-- Save a script containing the query you used to answer each question and your answer (as a comment).

-- 1. How many rows are in the names table? 1957046

-- SELECT COUNT(*)
-- FROM names;

-- 2. How many total registered people appear in the dataset? 351653025

-- SELECT SUM(num_registered)
-- FROM names;

-- 3. Which name had the most appearances in a single year in the dataset? Linda had the most with 99689 appearances.

-- SELECT name, MAX(num_registered)
-- FROM names
-- GROUP BY name
-- ORDER BY MAX(num_registered) DESC
-- LIMIT 1;

-- 4. What range of years are included? 1880 - 2018

-- SELECT MIN(year) AS min_year, MAX(year) AS max_year 
-- FROM names;

-- 5. What year has the largest number of registrations? 1957 with 4200022.

-- SELECT year, SUM(num_registered) AS total_registrations
-- FROM names
-- GROUP BY year
-- ORDER BY total_registrations DESC
-- LIMIT 1;

-- 6. How many different (distinct) names are contained in the dataset? 98400

SELECT COUNT(DISTINCT name)
FROM names;

-- 7. Are there more males or more females registered? There are more males.

-- SELECT gender, SUM(num_registered)
-- FROM names
-- GROUP BY gender;

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?

--Females Mary is the most popular overall
-- SELECT name, SUM(num_registered) AS total_registrations
-- FROM names
-- WHERE gender = 'F'
-- GROUP BY name
-- ORDER BY total_registrations DESC
-- LIMIT 1;

--Males James is the most popular overall
-- SELECT name, SUM(num_registered) AS total_registrations
-- FROM names
-- WHERE gender = 'M'
-- GROUP BY name
-- ORDER BY total_registrations DESC
-- LIMIT 1;



-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

--Females Emily
-- SELECT name, SUM(num_registered) AS total_registrations
-- FROM names
-- WHERE gender = 'F' AND year >= 2000 AND year <= 2009
-- GROUP BY name
-- ORDER BY total_registrations DESC
-- LIMIT 1;

--Males Jacob
-- SELECT name, SUM(num_registered) AS total_registrations
-- FROM names
-- WHERE gender = 'M' AND year >= 2000 AND year <= 2009
-- GROUP BY name
-- ORDER BY total_registrations DESC
-- LIMIT 1;


-- 10. Which year had the most variety in names (i.e. had the most distinct names)? 2008

-- SELECT year, COUNT(DISTINCT name) AS variety_count
-- FROM names
-- GROUP BY year
-- ORDER BY variety_count DESC
-- LIMIT 1;

-- 11. What is the most popular name for a girl that starts with the letter X? Ximena

-- SELECT name
-- FROM names
-- WHERE name LIKE 'X%' AND gender = 'F'
-- GROUP BY name
-- ORDER BY SUM(num_registered) DESC
-- LIMIT 1;

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'? 46

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE name LIKE 'Q_%' AND SUBSTRING(name, 2, 1) != 'u';

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question. Steven

-- SELECT
--     CASE
--         WHEN (SELECT SUM(num_registered) FROM names WHERE name = 'Stephen') > (SELECT SUM(num_registered) FROM names WHERE name = 'Steven') THEN 'Stephen'
--         ELSE 'Steven'
--     END AS more_popular_spelling;

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

-- --Unisex count 10773
-- SELECT COUNT(DISTINCT name) AS count_unisex_boys
-- FROM names
-- WHERE gender = 'M' AND name IN (SELECT name FROM names WHERE gender = 'F');

-- --Percentage unisex 10.95%
-- WITH unisex_names AS (
--     SELECT name
--     FROM names
--     GROUP BY name
--     HAVING COUNT(DISTINCT gender) = 2
-- )
-- SELECT COUNT(DISTINCT name) AS count_unisex,
--        COUNT(DISTINCT name) * 100.0 / (SELECT COUNT(DISTINCT name) FROM names) AS percentage_unisex
-- FROM unisex_names;

-- 15. How many names have made an appearance in every single year since 1880? 921

-- SELECT COUNT(*) AS count_names
-- FROM (
--     SELECT name
--     FROM names
--     WHERE year >= 1880
--     GROUP BY name
--     HAVING COUNT(DISTINCT year) = (SELECT MAX(year) - MIN(year) + 1 FROM names)
-- ) AS names_appeared_in_all_years;


-- 16. How many names have only appeared in one year? 21123

-- SELECT COUNT(*) AS count_names
-- FROM (
--     SELECT name
--     FROM names
--     GROUP BY name
--     HAVING COUNT(DISTINCT year) = 1
-- ) AS names_appeared_in_one_year;

-- 17. How many names only appeared in the 1950s? 3565

-- SELECT COUNT(*) AS count_names
-- FROM (
--     SELECT name
--     FROM names
--     WHERE year >= 1950 AND year <= 1959
--     GROUP BY name
--     HAVING COUNT(DISTINCT year) = 1
-- ) AS names_appeared_in_1950s;

-- 18. How many names made their first appearance in the 2010s? 31627

-- SELECT COUNT(*) AS count_names
-- FROM (
--     SELECT name
--     FROM names
--     WHERE year >= 2010 AND year <= 2019
--     GROUP BY name
--     HAVING MIN(year) = 2010
-- ) AS names_first_appeared_in_2010s;

-- 19. Find the names that have not be used in the longest. 
-- "Zilpah"
-- "Roll"
-- "Lelie"
-- "Sip"
-- "Ng"
-- "Ottillie"
-- "Pembroke"
-- "Bengiman"
-- "Etelka"
-- "Pantha"

-- SELECT name
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT year) = 1
-- ORDER BY MIN(year) ASC
-- LIMIT 10;


-- 20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.

--What are the top 5 names that have consistently increased in popularity from the year they first appeared until today?

-- "Linda"
-- "James"
-- "Michael"
-- "Robert"
-- "John"

-- SELECT name, MIN(year) AS first_year, MAX(year) AS last_year, MAX(num_registered) AS peak_registration
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT year) > 1
-- ORDER BY MAX(year) - MIN(year) DESC, peak_registration DESC
-- LIMIT 5;

--SQL Names - Bonus

-- 1. Find the longest name contained in this dataset. What do you notice about the long names?
--They seem to all have 15 characters and seem to be multiple names smashed together.

-- SELECT name
-- FROM names
-- ORDER BY LENGTH(name) DESC
-- LIMIT 100;

-- 2. How many names are palindromes (i.e. read the same backwards and forwards, such as Bob and Elle)?
-- 4091 I think.........

-- SELECT REVERSE(name)
-- FROM names
-- LIMIT 10;

-- SELECT name
-- FROM names
-- WHERE name ILIKE REVERSE(name)






