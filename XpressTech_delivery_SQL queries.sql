-- Viewing the table, number of columns, and data in each value.
SELECT TOP 10 *
FROM XpressTech;

--DEMOGRAPHY
-- The count of rows in the dataset
SELECT COUNT(*)
FROM XpressTech;


--Grouping the customers by gender
SELECT Gender,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Gender
ORDER BY Customers DESC;


--Grouping the customers by marital status
SELECT Marital_Status,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Marital_Status
ORDER BY Customers DESC;


-- Grouping the customers by age category
SELECT CASE WHEN Age > 30 THEN 'Above 30'
	        WHEN  Age BETWEEN 26 AND 30 THEN '26-30'
			WHEN Age BETWEEN 20 AND 25 THEN '20-25'
			ELSE 'Below 20'
			END AS 'Age Category',
			COUNT(*) AS Customers
FROM XpressTech
GROUP BY CASE WHEN Age > 30 THEN 'Above 30'
	        WHEN  Age BETWEEN 26 AND 30 THEN '26-30'
			WHEN Age BETWEEN 20 AND 25 THEN '20-25'
			ELSE 'Below 20'
			END;

--Grouping the customers by occupation
SELECT Occupation,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Occupation
ORDER BY Customers DESC;


--Grouping the customers by monthly income
SELECT Monthly_Income,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Monthly_Income
ORDER BY Customers DESC;


--Grouping the customers by educational qualifications
SELECT Educational_Qualifications,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Educational_Qualifications
ORDER BY Customers DESC;


--Grouping the customers by their family size
SELECT Family_size,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Family_size
ORDER BY Customers DESC;


--PYSCHOGRAPHY/PREFERENCE
--Grouping the customers by best medium for placing orders
SELECT Medium_P1 AS First_Medium_for_ordering,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Medium_P1
ORDER BY Customers DESC;


--Grouping the customers by second preferred medium for placing orders
SELECT Medium_P2 AS Seocnd_Medium_for_ordering,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Medium_P2
ORDER BY Customers DESC;


--Grouping the customers by the first time/meal they order
SELECT Meal_P1 AS First_meal_order,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Meal_P1
ORDER BY Customers DESC;


--Grouping the customers by second time/meal they order
SELECT Meal_P2 AS Second_meal_order,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Meal_P2
ORDER BY Customers DESC;


--Grouping the customers by best food preference when they place orders
SELECT Perference_P1 AS Food_preference,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Perference_P1
ORDER BY Customers DESC;


--Grouping the customers by second-best food preference
SELECT Perference_P2 AS Second_food_preference,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Perference_P2
ORDER BY Customers DESC;


--Grouping the customers by weekday they place orders
SELECT Order_Time AS Weekday_of_order,
	   COUNT(*) AS Customers
FROM XpressTech
GROUP BY Order_Time
ORDER BY Customers DESC;



-- SURVEY REVIEWS
-- Selecting columns from the survey reviews 
--           (Response: Very important - Important - Moderately important - Slightly important - Unimportant )
SELECT Less_Delivery_time,
	   High_Quality_of_package,
	   Number_of_calls,
	   Politeness,
	   Freshness,
	   Temperature,
	   Good_Taste,
	   Good_Quantity
FROM XpressTech;

-- Using UNION ALL to combine the responses
	SELECT 'Less_Delivery_time' AS Survey_Questions,
			Less_Delivery_time AS Responses
	FROM XpressTech
UNION ALL
	SELECT 'High_Quality_of_package' AS Survey_Questions,
			High_Quality_of_package AS Responses
	FROM XpressTech
UNION ALL
	SELECT 'Number_of_calls' AS Survey_Questions,
			Number_of_calls AS Responses
	FROM XpressTech
UNION ALL
	SELECT 'Politeness' AS Survey_Questions,
			Politeness AS Responses
	FROM XpressTech
UNION ALL
	SELECT 'Freshness' AS Survey_Questions,
			Freshness AS Responses
	FROM XpressTech
UNION ALL
	SELECT 'Temperature' AS Survey_Questions,
			Temperature AS Responses
	FROM XpressTech 
UNION ALL
	SELECT 'Good_Taste' AS Survey_Questions,
			Good_Taste AS Responses
	FROM XpressTech
UNION ALL
SELECT 'Good_Quantity' AS Survey_Questions,
	    Good_Quantity AS Responses
FROM XpressTech;


-- Using unpivot method
SELECT Survey_Questions,
	   Responses
FROM (SELECT Less_Delivery_time,
			 High_Quality_of_package,
			 Number_of_calls,
		     Politeness,
		     Freshness,
		     Temperature,
		     Good_Taste,
		     Good_Quantity
	    FROM XpressTech) As Source_table
UNPIVOT (Responses
		FOR [Survey_Questions] IN (Less_Delivery_time, High_Quality_of_package, Number_of_calls,
							Politeness, Freshness, Temperature, Good_Taste, Good_Quantity)
		) AS UNPivt_table;




-- Selecting columns from the survey reviews 
--           (Response: Strongly disagree - Disagree - Neutral - Agree - Strongly agree )
SELECT Ease_and_convenient,
	   Time_saving,
	   More_restaurant_choices,
	   Easy_Payment_option,
	   More_Offers_and_Discount,
	   Good_Food_quality,
	   Good_Tracking_system,
	   Self_Cooking,
	   Health_Concern,
	   Late_Delivery,
	   Poor_Hygiene,
	   Bad_past_experience,
	   Unavailability,
	   Unaffordable,
	   Long_delivery_time,
	   Delay_of_delivery_person_getting_assigned,
	   Delay_of_delivery_person_picking_up_food,
	   Wrong_order_delivered, 
	   Missing_item,
	   Order_placed_by_mistake,
	   Residence_in_busy_location,
	   Google_Maps_Accuracy,
	   Good_Road_Condition,
	   Low_quantity_low_time,
	   Delivery_person_ability
FROM XpressTech;



-- Unpivoting these columns
SELECT Survey_items,
	   Responses
FROM  (SELECT  Ease_and_convenient,
			   Time_saving,
			   More_restaurant_choices,
			   Easy_Payment_option,
			   More_Offers_and_Discount,
			   Good_Food_quality,
			   Good_Tracking_system,
			   Self_Cooking,
			   Health_Concern,
			   Late_Delivery,
			   Poor_Hygiene,
			   Bad_past_experience,
			   Unavailability,
			   Unaffordable,
			   Long_delivery_time,
			   Delay_of_delivery_person_getting_assigned,
			   Delay_of_delivery_person_picking_up_food,
			   Wrong_order_delivered, 
			   Missing_item,
			   Order_placed_by_mistake,
			   Residence_in_busy_location,
			   Google_Maps_Accuracy,
			   Good_Road_Condition,
			   Low_quantity_low_time,
			   Delivery_person_ability
		FROM XpressTech) AS Source_table
UNPIVOT (Responses
		FOR [Survey_items] IN ( Ease_and_convenient, Time_saving, More_restaurant_choices, Easy_Payment_option, More_Offers_and_Discount,
								Good_Food_quality, Good_Tracking_system, Self_Cooking, Health_Concern, Late_Delivery, Poor_Hygiene,
								   Bad_past_experience, Unavailability, Unaffordable, Long_delivery_time, Delay_of_delivery_person_getting_assigned,
								   Delay_of_delivery_person_picking_up_food, Wrong_order_delivered, Missing_item, Order_placed_by_mistake,
								   Residence_in_busy_location, Google_Maps_Accuracy, Good_Road_Condition, Low_quantity_low_time, Delivery_person_ability)
			   ) AS UNPivt_table;