
create database personal_blog;
use personal_blog;

CREATE TABLE users (
    username VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    userdomain VARCHAR(255),
    enabled BOOLEAN DEFAULT TRUE
);



CREATE TABLE authorities (
    username VARCHAR(100) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    PRIMARY KEY (username, authority),
    FOREIGN KEY (username) REFERENCES users(username)
);


CREATE TABLE blog (
    id INT PRIMARY KEY AUTO_INCREMENT,
    blogname VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

 CREATE TABLE comments (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    id INT NOT NULL,
    comment TEXT NOT NULL,
    username VARCHAR(100) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id) REFERENCES blog(id)
);

 INSERT INTO users (userName, password, userDomain, enabled)
VALUES ('john_doe', 'password123', 'example.com', TRUE);

INSERT INTO users (userName, password, userDomain, enabled)
VALUES ('jane_smith', 'hello123', 'example.org', FALSE);


INSERT INTO authorities (username, authority)
VALUES ('john_doe', 'ROLE_USER');

INSERT INTO authorities (username, authority)
VALUES ('john_doe', 'ROLE_ADMIN');

INSERT INTO authorities (username, authority)
VALUES ('jane_smith', 'ROLE_USER');



INSERT INTO blog (blogname, username, title, content)
VALUES ('My Personal Blog', 'john_doe', 'Introduction', 'Welcome to my blog! This is my first post.');

INSERT INTO blog (blogname, username, title, content)
VALUES ('Tech Tips', 'jane_smith', 'Getting Started with Java', 'In this post, we will explore Java basics.');


INSERT INTO comments (id, comment, username)
VALUES (1, 'Great post!', 'guest123');

INSERT INTO comments (id, comment, username)
VALUES (1, 'Looking forward to more content.', 'tech_guru');

INSERT INTO comments (id, comment, username)
VALUES (2, 'Thanks for the tutorial!', 'learner321');















