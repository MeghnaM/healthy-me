-- Database Queries

-- User Interaction Queries
-- Calculate BMI for user A on date X (**Join)
select u.first_name, u.last_name, b.date_x, round(b.weight/(b.height*b.height), 3) as BMI 
from users u, have_bodystats b 
where u.user_id = b.user_id 
and u.first_name='Ford' 
and u.last_name='Prefect'
and b.date_x = '2016-07-04';

-- Change in weight from date X to date Y for user A (**Join)
select b.weight - (select s.weight 
                  from have_bodystats s, users u 
                  where u.user_id = s.user_id 
                  and s.date_x = '2016-07-08' 
                  and u.first_name = 'Ford' 
                  and u.last_name = 'Prefect') as difference_in_weight 
from have_bodystats b, users u 
where u.user_id = b.user_id 
and b.date_x = '2016-07-04' 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect';

-- Calorie consumption breakdown for user A on date X (**Join)
select n.food_name, n.meal_type, n.calories 
from users u, need_nutrition n 
where u.user_id = n.user_id 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and date_x = '2016-07-04';

-- Total calories consumed by user A on date X (**Join and Group by)
select u.first_name, u.last_name, n.date_x, sum(n.calories) as total_calories_consumed 
from users u, need_nutrition n 
where u.user_id = n.user_id 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and n.date_x = '2016-07-04' 
group by u.first_name, u.last_name, n.date_x;

-- Total calories burned on date X by user A (**Join and Group by)
select u.first_name, u.last_name, s.date_x, sum(a.calories_burned)+sum(s.calories_burned) as total_calories_burned 
from users u, perform_activities a, walk_steps s 
where u.user_id = a.activity_id
and u.user_id = s.step_id
and a.date_x = s.date_x 
and a.date_x = '2016-07-04' 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
group by u.first_name, u.last_name, s.date_x;

-- Calculate average steps walked per day, from date X to date Y for user A (**Join)
select round(avg(s.num_steps), 2) as avg_steps 
from users u, walk_steps s 
where u.user_id = s.user_id 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and s.date_x >= '2016-07-04' 
and s.date_x <= '2016-07-08'; 

-- Average calories burned per day, from date X to date Y for user A (**Join and Group by)
select a.date_x, round(avg(a.calories_burned), 2) as avg_calories_burned 
from users u, perform_activities a 
where u.user_id = a.user_id 
and a.date_x >= '2016-07-04' 
and a.date_x <= '2016-07-08' 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
group by a.date_x
order by a.date_x; 

-- Average calories consumed per meal and number of meals per day, from date X to date Y for user A (**Join and Group by)
select n.date_x, round(avg(n.calories), 2) as avg_calories_per_meal, count(n.user_id) as num_meals 
from users u, need_nutrition n 
where u.user_id = n.user_id 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and n.date_x >= '2016-07-04' 
and n.date_x <= '2016-07-08' 
group by n.date_x
order by n.date_x; 

-- Maximum heart rate during activity per day from date X to date Y for user A (**Join and Group by)
select u.first_name, u.last_name, h.date_x, a.start_time, a.end_time, max(h.heart_rate) as max_heart_rate 
from users u, have_heartrate h, perform_activities a 
where u.user_id = h.user_id 
and u.user_id = a.user_id 
and a.date_x = h.date_x 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and h.date_x >= '2016-07-04' 
and h.date_x <= '2016-07-08' 
and h.start_time >= a.start_time 
and h.end_time <= a.end_time 
group by u.first_name, u.last_name, h.date_x, a.start_time, a.end_time
order by h.date_x;

-- Average heart rate during sleep per day from date X to date Y for user A (**Join and Group by)
select h.date_x, s.start_time, s.end_time, round(avg(h.heart_rate), 2) as avg_heart_rate 
from users u, have_heartrate h, need_sleep s
where u.user_id = h.user_id 
and u.user_id = s.user_id 
and s.date_x = h.date_x 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
and h.date_x >= '2016-07-04' 
and h.date_x <= '2016-07-08' 
and h.start_time >= s.start_time 
and h.end_time <= s.end_time 
group by u.first_name, u.last_name, h.date_x, s.start_time, s.end_time
order by h.date_x;

-- Average resting heart rate for each day, from date X to date Y (**Join and Group by)
select h.date_x, round(avg(h.heart_rate), 2) as resting_heart_rate 
from users u, have_heartrate h 
where u.user_id = h.user_id 
and u.first_name = 'Ford' 
and u.last_name = 'Prefect' 
group by h.date_x 
order by h.date_x;

-- Insert Queries
-- Add user
select max(user_id) from users;
insert into Users(user_id, first_name, last_name, age) values (11, 'Meghna', 'Malhotra', 21);

-- Add body stats 
select max(stat_id) from have_bodystats;
insert into have_bodystats(stat_id, user_id, height, weight, date_x) values (11, 11, 1.58, 56.7, '2016-07-30');

-- Add meal 
select max(meal_id) from need_nutrition;
insert into need_nutrition(meal_id, user_id, food_name, meal_type, calories, date_x) values (20, 11, 'Yoghurt with Muesli and Fruits', 'breakfast', 250, '2016-07-30');
insert into need_nutrition(meal_id, user_id, food_name, meal_type, calories, date_x) values (21, 11, 'Aloo Paratha', 'lunch', 330, '2016-07-30');  
insert into need_nutrition(meal_id, user_id, food_name, meal_type, calories, date_x) values (22, 11, 'Pretzels with Nutella', 'dinner', 490, '2016-07-30');  
insert into need_nutrition(meal_id, user_id, food_name, meal_type, calories, date_x) values (23, 11, 'Chocolate Ice Cream', 'snack', 200, '2016-07-30');  

-- Add exercise
select max(activity_id) from perform_activities;
insert into perform_activities(activity_id, user_id, name, calories_burned, date_x, start_time, end_time) values (10, 11, 'Strength Training', 240, '2016-07-30', '07:00:00', '08:00:00');
