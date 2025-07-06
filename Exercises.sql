--List all houses in neighborhoods with a school rating above 8, showing the address, neighborhood, and school rating.
SELECT
    hou.house_id,
    hou.address AS house_address,
    hou.city,
    hou.state,
    hou.neighborhood_id,
    nei.name AS neighbourhood_name,
    nei.school_rating
FROM houses AS hou
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE nei.school_rating > 8;

--Find the total number of houses sold by each agent, and display the agent's name and the count.
SELECT
    agt.name AS agent_name,
    COUNT(sal.sale_id) AS houses_sold
FROM agents AS agt
    LEFT JOIN sales AS sal
    ON agt.agent_id = sal.agent_id
GROUP BY agt.name;

--Show the average sale price for each neighborhood.
SELECT
    nei.name AS neighborhood_name,
    AVG(sal.sale_price) AS avg_sale
FROM houses AS hou
    LEFT JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
    JOIN sales AS sal
    ON sal.house_id = hou.house_id
GROUP BY nei.name
ORDER BY 2;

--List all neighborhoods where the average house price is above $400,000.
SELECT
    nei.name AS neighborhood_name,
    AVG(hou.price) AS avg_price
FROM neighborhoods AS nei
    JOIN houses AS hou
    ON nei.neighborhood_id = hou.neighborhood_id
GROUP BY nei.name
HAVING AVG(hou.price) > 400000
ORDER BY 2;

--For each agent, display their name and the total value of houses they have sold.
SELECT
    agt.name AS agent_name,
    SUM(sal.sale_price) AS total_sales
FROM agents AS agt
    JOIN sales AS sal
    ON agt.agent_id = sal.agent_id
GROUP BY agt.name;

--Show the top 3 most expensive houses that are currently listed, including their address, price, and neighborhood.
SELECT TOP 3
    hou.house_id,
    hou.address AS house_address,
    hou.price,
    nei.name AS neighbohood_name
FROM houses hou
    LEFT JOIN sales AS sal
    ON hou.house_id = sal.house_id
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE hou.status = 'Listed'
ORDER BY 3 DESC;

--List all buyers (name and email) who purchased houses in Dallas, along with the address of the house they bought.
SELECT
    sal.buyer_name,
    sal.buyer_email,
    hou.address,
    hou.city
FROM sales AS sal
    LEFT JOIN houses AS hou
    ON sal.house_id = hou.house_id
WHERE  hou.status = 'Sold' AND hou.city = 'Dallas';

--Find the neighborhood with the highest number of listed houses.
SELECT TOP 1
    nei.name AS neighborhood_name,
    COUNT(hou.house_id) AS listed_houses
FROM houses AS hou
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE hou.status = 'Listed'
GROUP BY nei.name
ORDER BY COUNT(hou.house_id) DESC;

--For each neighborhood, show the count of houses with 4 or more bedrooms.
SELECT
    nei.name AS neighborhood_name,
    COUNT(hou.house_id) AS house_count
FROM houses AS hou
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE hou.bedrooms >= 4
GROUP BY nei.name;

--List all agents who have never sold a house.
SELECT agt.name AS agent_name
FROM agents AS agt
    LEFT JOIN sales AS sal
    ON agt.agent_id = sal.agent_id
WHERE sal.agent_id IS NULL;

--For each neighborhood, list the average walk score and the average sale price of houses sold there.
SELECT
    nei.name AS neighborhood_name,
    AVG(nei.walk_score) OVER (PARTITION BY nei.name) AS avg_walk_score,
    AVG(sal.sale_price) OVER (PARTITION BY nei.name) AS avg_sale_price
FROM neighborhoods AS nei
    JOIN houses AS hou
    ON hou.neighborhood_id = nei.neighborhood_id
    JOIN sales AS sal
    ON sal.house_id = hou.house_id;

--Show houses built after 2010 that have a garage and are in neighborhoods with an average income above $80,000.
SELECT *
FROM houses AS hou
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE hou.year_built > '2010'
    AND hou.garage >= 1
    AND nei.avg_income > 80000;

--List all houses that have not yet been sold (i.e., appear in houses but not in sales), showing address, price, and neighborhood.
SELECT
    hou.house_id,
    hou.address,
    hou.price,
    nei.name AS neighborhood_name
FROM houses AS hou
    LEFT JOIN sales AS sal
    ON hou.house_id = sal.house_id
    JOIN neighborhoods AS nei
    ON hou.neighborhood_id = nei.neighborhood_id
WHERE sal.house_id IS NULL;

--Find all neighborhoods where every house has at least 2 bathrooms.
SELECT *
FROM neighborhoods AS nei
    JOIN houses AS hou
    ON nei.neighborhood_id = hou.neighborhood_id
WHERE hou.bathrooms >= 2;

--Display the agent who sold the most expensive house, including the sale price and address.
SELECT TOP 1
    agt.agent_id,
    agt.name AS agent_name,
    sal.sale_price,
    hou.address AS house_address
FROM sales AS sal
    JOIN agents AS agt
    ON sal.agent_id = agt.agent_id
    JOIN houses AS hou
    ON sal.house_id = hou.house_id
ORDER BY sal.sale_price DESC;
