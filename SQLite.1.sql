-- Q1

SELECT sum(city.POPULATION)
FROM city
JOIN country
ON city.CountryCode = country.Code
WHERE country.CONTINENT  ="Asia";

--Q2 

SELECT  city.NAME 
FROM city
JOIN country 
ON City.CountryCode = country.Code 
WHERE country.CONTINENT  = "Africa";

--Q3  

SELECT country.continent, FLOOR(AVG(city.population))
FROM country
JOIN city ON city.countrycode = country.code
GROUP BY country.continent
