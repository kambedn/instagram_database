USE instagram;

-- Question 1
-- We want to reward users who have been around the longest.
-- Find the 5 oldest users.
SELECT username
FROM users
ORDER BY created_at
LIMIT 5;

-- Question 2
-- We need to figure out when to schedule an ad campaign.
-- What day of the week do most users register on?
SELECT DAYNAME(created_at) AS day_of_the_week, COUNT(*) AS users_registered
FROM users
GROUP BY day_of_the_week
ORDER BY users_registered DESC
LIMIT 2;

-- Question 3
-- We want to target our inactive users with an email campaign.
-- Find the users who have never posted a photo.
SELECT username
FROM users
LEFT JOIN photos
	ON photos.user_id = users.id
WHERE photos.id IS NULL;

-- Question 4
-- We're running a new contest to see who can get the most likes on a single photo.
-- Who won?
SELECT image_url, username, COUNT(*) AS total_likes
FROM likes
JOIN photos
	ON photos.id = likes.photo_id
JOIN users
	ON photos.user_id = users.id
GROUP BY image_url
ORDER BY total_likes DESC
LIMIT 1;

-- Question 5
-- Our investor want to know how many times the average user posts.
SELECT
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_user_posts;

-- Question 6
-- A brand wants to know which hastags to use in a post.
-- What are the top 5 most commonly used hashtags?
SELECT tag_name, COUNT(*) AS total_count
FROM tags
JOIN photo_tags
	ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY total_count DESC
LIMIT 5;

-- Question 7
-- We have a small problem with bots on our site
-- Find users who have liked every single photo on the site
SELECT username, COUNT(*) AS photos_liked
FROM users
JOIN likes
	ON users.id = likes.user_id
GROUP BY username
HAVING photos_liked = (SELECT COUNT(*) FROM photos);
