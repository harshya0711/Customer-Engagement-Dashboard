Create database customer_engagement;

use customer_engagement;

--  Total Users by Tier and Source --

SELECT tier, source_channel, COUNT(*) AS total_users
FROM mock_user_data
GROUP BY tier, source_channel
ORDER BY total_users DESC;

-- Total Users by Tier and Source --

SELECT DATE(timestamp) AS activity_date,
 COUNT(DISTINCT user_id) AS dau
FROM mock_activity_data
GROUP BY activity_date
ORDER BY activity_date;

--  New Users Over Time --

SELECT MONTH(signup_date) AS month,
    COUNT(user_id) AS new_signups
FROM mock_user_data
GROUP BY MONTH(signup_date)
ORDER BY month;

--  Average Session Duration by Tier --

SELECT ud.tier, ROUND(AVG(a.session_duration), 2)
   AS avg_duration
FROM mock_activity_data a
JOIN mock_user_data ud ON a.user_id = ud.user_id
GROUP BY ud.tier;

--  Top 5 Most Used Features --

SELECT feature_name, SUM(usage_count) AS total_usage
FROM mock_feature_usage
GROUP BY feature_name
ORDER BY total_usage DESC
LIMIT 5;

--  Feature Adoption Rate by Tier  --

SELECT ud.tier, COUNT(DISTINCT fu.user_id) AS adopters,
       COUNT(DISTINCT ud.user_id) AS total_users,
       ROUND(COUNT(DISTINCT fu.user_id) / COUNT(DISTINCT ud.user_id) * 100, 2) AS adoption_rate
FROM mock_user_data ud
LEFT JOIN mock_feature_usage fu ON ud.user_id = fu.user_id
GROUP BY ud.tier;

--  Avg Features Used per User by Source  -- 

SELECT ud.source_channel, ROUND(AVG(sub.feature_count), 2) AS avg_features
FROM (
    SELECT user_id, COUNT(DISTINCT feature_name) AS feature_count
    FROM mock_feature_usage
    GROUP BY user_id
) sub
JOIN mock_user_data ud ON sub.user_id = ud.user_id
GROUP BY ud.source_channel;

--  Most Engaged Users (Top 10 by Duration)  --

SELECT user_id, round(SUM(session_duration),2) AS total_time
FROM mock_activity_data
GROUP BY user_id
ORDER BY total_time DESC
LIMIT 10;

--  Session Frequency Buckets  --

SELECT user_id,
       COUNT(*) AS session_count,
       CASE 
           WHEN COUNT(*) >= 15 THEN 'Power User'
           WHEN COUNT(*) BETWEEN 5 AND 14 THEN 'Moderate User'
           ELSE 'Low User'
       END AS user_type
FROM mock_activity_data
GROUP BY user_id;

--  Avg Features Used by Platinum Users  --

SELECT AVG(features_used) AS avg_features
FROM (
    SELECT user_id, COUNT(DISTINCT feature_name) AS features_used
    FROM mock_feature_usage
    WHERE user_id IN (SELECT user_id FROM mock_user_data WHERE tier = 'Platinum')
    GROUP BY user_id
) sub;

--  Feature Popularity Across Tiers  --

SELECT ud.tier, fu.feature_name, SUM(fu.usage_count) AS total_usage
FROM mock_feature_usage fu
JOIN mock_user_data ud ON fu.user_id = ud.user_id
GROUP BY ud.tier, fu.feature_name
ORDER BY ud.tier, total_usage DESC;

--  Time-of-Day Engagement (Peak Hours) -- 

SELECT HOUR(timestamp) AS hour_of_day, COUNT(*) AS sessions
FROM mock_activity_data
GROUP BY hour_of_day
ORDER BY sessions DESC
LIMIT 5;

