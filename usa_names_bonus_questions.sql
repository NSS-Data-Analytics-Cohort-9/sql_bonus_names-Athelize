-- ## SQL Names

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

-- 7. Are there more males or more females registered?

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?

-- 11. What is the most popular name for a girl that starts with the letter X?

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

-- 15. How many names have made an appearance in every single year since 1880?

-- 16. How many names have only appeared in one year?

-- 17. How many names only appeared in the 1950s?

-- 18. How many names made their first appearance in the 2010s?

-- 19. Find the names that have not be used in the longest.

-- 20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.