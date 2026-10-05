CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, city TEXT);
CREATE TABLE friendships (
    user_id INTEGER, friend_id INTEGER, since DATE,
    PRIMARY KEY (user_id, friend_id));
CREATE TABLE posts (id INTEGER PRIMARY KEY, user_id INTEGER,
    text TEXT, created DATETIME);
CREATE TABLE likes (user_id INTEGER, post_id INTEGER,
    PRIMARY KEY (user_id, post_id));
