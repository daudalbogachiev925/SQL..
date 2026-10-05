-- Друзья Ани
SELECT u.name FROM friendships f
JOIN users u ON f.friend_id=u.id
WHERE f.user_id=1
UNION
SELECT u.name FROM friendships f
JOIN users u ON f.user_id=u.id
WHERE f.friend_id=1;

-- Кол-во друзей
SELECT u.name, COUNT(*) AS friends FROM users u
JOIN friendships f ON u.id=f.user_id OR u.id=f.friend_id
GROUP BY u.id ORDER BY friends DESC;

-- Взаимные (2-сторонние)
SELECT a.name, b.name FROM friendships f1
JOIN friendships f2 ON f1.user_id=f2.friend_id AND f1.friend_id=f2.user_id
JOIN users a ON a.id=f1.user_id
JOIN users b ON b.id=f1.friend_id
WHERE f1.user_id < f1.friend_id;
