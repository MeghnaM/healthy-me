-- Insert data into tables

-- **IMP. Currently we have 10 users in our database. 
-- In the interest of saving space, all tables except Users carry data for only 2 users. 
-- Also, the data is only spread over a 5 day period from 2016-07-04 (Monday) to 2016-07-08 (Friday).

-- Users
-- 10 distinct users. 10 entries.
insert into Users(user_id, first_name, last_name, age) values (0, 'Ford', 'Prefect', 35);
insert into Users values (1, 'Daenerys', 'Targaryen', 23);
insert into Users values (2, 'Albus', 'Percival Wulfric Brian Dumbledore', 150);
insert into Users values (3, 'Sherlock', 'Holmes', 36);
insert into Users values (4, 'Tony', 'Stark', 40);
insert into Users values (5, 'Vito', 'Andolini Corleone', 62);
insert into Users values (6, 'Scarlet', 'O’Hara', 24);
insert into Users values (7, 'Lisbeth', 'Salander', 22);
insert into Users values (8, 'Hua', 'Mulan', 17);
insert into Users values (9, 'Princess Leia', 'Organa', 26);

-- have_BodyStats
-- 1 value per day per user. Values for 2 users over 5 days. 10 entries.
-- Height in Meters, Weight in Kilograms.
insert into have_BodyStats(stat_id, user_id, height, weight, date_x) values (0, 0, 1.89, 72.57, '2016-07-04');
insert into have_BodyStats values (1, 1, 1.58, 54.43, '2016-07-04');
insert into have_BodyStats values (2, 0, 1.89, 72.55, '2016-07-05');
insert into have_BodyStats values (3, 1, 1.58, 54.77, '2016-07-05');
insert into have_BodyStats values (4, 0, 1.89, 72.12, '2016-07-06');
insert into have_BodyStats values (5, 1, 1.58, 53.84, '2016-07-06');
insert into have_BodyStats values (6, 0, 1.89, 72.09, '2016-07-07');
insert into have_BodyStats values (7, 1, 1.58, 53.20, '2016-07-07');
insert into have_BodyStats values (8, 0, 1.89, 71.52, '2016-07-08');
insert into have_BodyStats values (9, 1, 1.58, 52.87, '2016-07-08');

-- walk_Steps:
-- Total steps walked per user per day. Values for 2 users over 5 days. 10 entries.
insert into walk_Steps(step_id, user_id, date_x, num_steps, calories_burned) values (0, 0, '2016-07-04', 10261, 422);
insert into walk_Steps values (1, 1, '2016-07-04', 11002, 465);
insert into walk_Steps values (2, 0, '2016-07-05', 10941, 440);
insert into walk_Steps values (3, 1, '2016-07-05', 12032, 493);
insert into walk_Steps values (4, 0, '2016-07-06', 9876, 397);
insert into walk_Steps values (5, 1, '2016-07-06', 11243, 489);
insert into walk_Steps values (6, 0, '2016-07-07', 11132, 452);
insert into walk_Steps values (7, 1, '2016-07-07', 10923, 432);
insert into walk_Steps values (8, 0, '2016-07-08', 11002, 465);
insert into walk_Steps values (9, 1, '2016-07-08', 12234, 525);

-- perform_Activities
-- 1 activity per day per user. Values for 2 users over 5 days. 10 entries.
insert into perform_Activities(activity_id, user_id, name, calories_burned, date_x, start_time, end_time) values (0, 0, 'Strength Training', 150, '2016-07-04', '07:00:00', '08:00:00');
insert into perform_Activities values (1, 1, 'Hiking', 246, '2016-07-04', '12:00:00', '13:00:00');
insert into perform_Activities values (2, 0, 'Horseback Riding', 167, '2016-07-05', '07:00:00', '08:00:00');
insert into perform_Activities values (3, 1, 'Aerobics', 230, '2016-07-05', '12:00:00', '13:00:00');
insert into perform_Activities values (4, 0, 'Dancing', 190, '2016-07-06', '07:00:00', '08:00:00');
insert into perform_Activities values (5, 1, 'Calisthenics', 328, '2016-07-06', '12:00:00', '13:00:00');
insert into perform_Activities values (6, 0, 'Rock Climbing', 235, '2016-07-07', '07:00:00', '08:00:00');
insert into perform_Activities values (7, 1, 'Tai Chi', 137, '2016-07-08', '12:00:00', '13:00:00');
insert into perform_Activities values (8, 0, 'Rowing', 295, '2016-07-08', '07:00:00', '08:00:00');
insert into perform_Activities values (9, 1, 'Gymnastics', 130, '2016-07-08', '12:00:00', '13:00:00');

-- need_Sleep
-- 1 sleep session per day, per user. Values for 2 users over 5 days. 10 entries.
insert into need_Sleep(sleep_session_id, user_id, date_x, start_time, end_time) values (0, 0, '2016-07-04', '00:00:00', '07:35:00');
insert into need_Sleep values (1, 1, '2016-07-04', '00:30:00', '05:55:00');
insert into need_Sleep values (2, 0, '2016-07-05', '23:00:00', '08:35:00'); 
insert into need_Sleep values (3, 1, '2016-07-05', '23:45:00', '05:35:00');
insert into need_Sleep values (4, 0, '2016-07-06', '22:00:00', '05:30:00');
insert into need_Sleep values (5, 1, '2016-07-06', '23:00:00', '04:55:00');
insert into need_Sleep values (6, 0, '2016-07-07', '22:30:00', '06:35:00');
insert into need_Sleep values (7, 1, '2016-07-07', '22:00:00', '09:55:00');
insert into need_Sleep values (8, 0, '2016-07-08', '23:00:00', '07:35:00');
insert into need_Sleep values (9, 1, '2016-07-08', '21:50:00', '06:35:00');

-- need_Nutrition
-- 2 meals per day, per user. Values for 2 users over 5 days. 20 entries.
insert into need_Nutrition(meal_id, user_id, food_name, meal_type, calories, date_x) values (0, 0, 'Egg Noodles', 'lunch', 450, '2016-07-04');
insert into need_Nutrition values (1, 0, 'Spaghetti Pasta', 'dinner', 595, '2016-07-04');
insert into need_Nutrition values (2, 1,'Ice Cream Sundae', 'lunch', 445, '2016-07-04');
insert into need_Nutrition values (3, 1, 'Halal Food', 'dinner', 620, '2016-07-04');
insert into need_Nutrition values (4, 0, 'English Omelete Breakfast', 'lunch', 630, '2016-07-05');
insert into need_Nutrition values (5, 0, 'Spaghetti Pasta', 'dinner', 545, '2016-07-05');
insert into need_Nutrition values (6, 1, 'Pepperoni Pizza', 'lunch', 724, '2016-07-05');
insert into need_Nutrition values (7, 1, 'Tossed Meat Salad', 'dinner', 600, '2016-07-05');
insert into need_Nutrition values (8, 0, 'Caesar Salad', 'lunch', 605, '2016-07-06');
insert into need_Nutrition values (9, 0, 'Belgian Waffles', 'dinner', 582, '2016-07-06');
insert into need_Nutrition values (10, 1, 'Big Mac', 'lunch', 630, '2016-07-06');
insert into need_Nutrition values (11, 1, 'Pancakes', 'dinner', 545, '2016-07-06');
insert into need_Nutrition values (12, 0, 'Spaghetti Pasta', 'lunch', 400, '2016-07-07');
insert into need_Nutrition values (13, 0, 'Cottage Cheese with Vegetables', 'dinner', 530, '2016-07-07');
insert into need_Nutrition values (14, 1, 'Waffles', 'lunch', 545, '2016-07-07');
insert into need_Nutrition values (15, 1, 'Spaghetti Pasta', 'dinner', 655, '2016-07-07');
insert into need_Nutrition values (16, 0, 'Sushi', 'lunch', 720, '2016-07-08');
insert into need_Nutrition values (17, 0, 'KFC Chicken Bucket', 'dinner', 435, '2016-07-08');
insert into need_Nutrition values (18, 1, 'French Toast with Nutella', 'lunch', 605, '2016-07-08');
insert into need_Nutrition values (19, 1, 'Rice and Potatoes', 'dinner', 595, '2016-07-08');

-- Heart Rate
-- Average heart rate per hour per day per user. Values for 2 users over 5 days (i.e. 120 hours). 240 entries.
\copy have_HeartRate(hr_id, user_id, heart_rate, date_x, start_time, end_time) from 'HeartRateData.csv' with CSV;
