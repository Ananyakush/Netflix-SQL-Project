-- How many shows are available per country? 
SELECT 
    country, COUNT(show_id)
FROM
    netflix_data
GROUP BY country;

--  Retrieve all shows released in 2020 in the dataset
SELECT 
    show_id, type, title
FROM
    netflix_data
WHERE
    release_year = 2020;
    
-- List all shows with the word "Love" in the title. 
 SELECT 
    show_id, title
FROM
    netflix_data
WHERE
    title LIKE '%love%';
    
-- Count the total number of shows in the dataset.  
SELECT 
    COUNT(*) AS Total_shows
FROM
    netflix_data;
    
-- How many unique ratings are available in the dataset?

SELECT 
    COUNT(DISTINCT (rating)) AS distinct_rating
FROM
    netflix_data;
   
-- Find shows with ratings ‘TV-MA’, ‘TV-14’, or ‘R
SELECT 
    title, rating
FROM
    netflix_data
WHERE
    rating in ('TV-MA','TV-14','R');
    
-- Display shows ordered by their release year 
-- in descending order.
SELECT 
    show_id, title, release_year
FROM
    netflix_data
ORDER BY release_year DESC;

 -- Find shows released between 2015 and 2020. 
 SELECT 
    title, release_year
FROM
    netflix_data
WHERE
    release_year BETWEEN '2015' AND '2020';
    
-- Retrieve all movies along with their director details.
SELECT 
    type, title, director
FROM
    netflix_data
WHERE
    type = 'movie';
    
-- Display the month and year each show 
-- was added to the dataset. 

SELECT 
    title, YEAR(date_added) AS YEAR, MONTH(date_added) AS MONTH
FROM
    netflix_data;
    
-- Show titles and their types, 
-- but alias the type column as ‘Category’
SELECT 
    title, type AS category
FROM
    netflix_data;

-- Calculate total duration of all movies listed
SELECT 
    SUM(duration) AS Total_duration
FROM
    netflix_data;
    
-- Find all ratings where there are more than 
-- 50 shows in that category.
SELECT 
    rating, COUNT(show_id) AS total_show
FROM
    netflix_data
GROUP BY rating
HAVING COUNT(show_id) > 50
ORDER BY total_show DESC;

-- Display a summary combining title and description fields
SELECT 
    CONCAT(title, ' - ', descriptions) AS new_descriptions
FROM
    netflix_data;

-- Create a column that labels each show as
-- “Recent” if added after 2020, otherwise “Old”.
SELECT 
    title,
    release_year,
    CASE
        WHEN YEAR(date_added) > 2020 THEN 'recent'
        ELSE 'old'
    END AS new_label
FROM
    netflix_data;
    
-- Find the most recent date a show was added.
SELECT 
    title, date_added
FROM
    netflix_data
WHERE
    date_added = (SELECT 
            MAX(date_added)
        FROM
            netflix_data)
LIMIT 1;

-- Find shows that were added after 
-- the latest addition date for “TV SHOWS”.
SELECT 
    title, type
FROM
    netflix_data
WHERE
    date_added > (SELECT 
            MAX(date_added) AS latest_date
        FROM
            netflix_data
        WHERE
            type = 'Tv show')
        AND type IN ('Movie' , 'TV shows');
        
-- Retrieve shows where the release year 
-- is the latest release year in the dataset.
SELECT 
    Title, release_year
FROM
    netflix_data
WHERE
    release_year = (SELECT 
            MAX(release_year) AS latest_year
        FROM
            netflix_data);
            
-- Find the number of shows grouped by country and rating.
SELECT 
    country, rating, COUNT(*) AS total_shows
FROM
    netflix_data
GROUP BY country , rating;

-- Replace any NULL values in the director field with “No Director”.
 SELECT 
    title, 
    IFNULL(NULLIF(TRIM(director), ''), 'No Director') AS director
FROM 
    netflix_data;
    
-- Retrieve shows along with only 
-- the year part of the date added.
SELECT 
    title, YEAR(date_added)
FROM
    netflix_data;
   
-- Create an index on the title column for faster searches.
create index idx_title on netflix_data(title);

-- Delete entries where the title contains “Test Show”.
SELECT 
    *
FROM
    netflix_data
WHERE
    title = '9';

DELETE FROM netflix_data 
WHERE
    title = '% 9 %';
 
SELECT 
    *
FROM
    netflix_data
WHERE
    title LIKE '% 9 %';
 
-- Combine lists of all movies and 
-- TV-MA rated shows from the dataset.
SELECT 
    title, 'movie' AS type
FROM
    netflix_data
WHERE
    type = 'movie' 
UNION SELECT 
    title, 'TV-MA' AS type
FROM
    netflix_data
WHERE
    type = 'TV-MA';

-- Display only the first 10 characters of each description.
SELECT 
    title, LEFT(descriptions, 40) AS short_description
FROM
    netflix_data;

-- Find the average release year for all shows in the dataset.
SELECT 
    AVG(CONVERT( release_year , UNSIGNED)) AS release_year
FROM
    netflix_data
WHERE
    release_year IS NOT NULL
        OR release_year != '';

-- Identify duplicate titles in the dataset.
SELECT 
    title, COUNT(*) AS title_count
FROM
    netflix_data
GROUP BY title
HAVING COUNT(*) > 1;
    
-- Display the third and fourth most recently added shows.
SELECT 
    Title, date_added
FROM
    netflix_data
ORDER BY date_added DESC
LIMIT 2 OFFSET 2;

-- Display shows where the release year is 
-- the average release year in the dataset.
SELECT 
    title, release_year
FROM
    netflix_data
WHERE
    release_year = (SELECT 
            ROUND(AVG(release_year))
        FROM
            netflix_data);

-- Identify shows where “Series” is found in the title. 
SELECT 
    title
FROM
    netflix_data
WHERE
    title LIKE '% series %';

-- Count shows grouped by both rating and country.
SELECT 
    rating, country, COUNT(show_id)
FROM
    netflix_data
GROUP BY rating , country;

-- Assign a rank to shows ordered by date added. 
SELECT title, date_added, 
       ROW_NUMBER() OVER (ORDER BY date_added DESC, title) AS ranks
FROM netflix_data;


   
    
    
    
    
    
    
    
    
    
    


 

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  
    
    
    
    
    
    
    
    
    
    
    
    
