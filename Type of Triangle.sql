/*

Problem: 

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

*/

-- Solution:

SELECT TriangleType
FROM (
SELECT A, B, C,
       CASE
         -- check if it's not a triangle
         WHEN (A + B <= C OR A + C <= B OR B + C <= A) THEN 'Not A Triangle'
         -- check if it's equilateral
         WHEN (A = B AND B = C) THEN 'Equilateral'
         -- check if it's isosceles
         WHEN (A = B OR B = C OR A = C) THEN 'Isosceles'
         -- otherwise, it's scalene
         ELSE 'Scalene'
       END AS TriangleType
FROM TRIANGLES);
