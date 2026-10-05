-- Топ постов по лайкам
SELECT p.text, u.name, COUNT(l.user_id) AS likes
FROM posts p
JOIN users u ON p.user_id=u.id
LEFT JOIN likes l ON p.id=l.post_id
GROUP BY p.id ORDER BY likes DESC;

-- Лента Ани (посты её и друзей)
WITH my_friends AS (
    SELECT friend_id AS id FROM friendships WHERE user_id=1
    UNION
    SELECT user_id AS id FROM friendships WHERE friend_id=1
)
SELECT p.text, u.name FROM posts p
JOIN users u ON p.user_id=u.id
WHERE p.user_id=1 OR p.user_id IN (SELECT id FROM my_friends)
ORDER BY p.created DESC;
