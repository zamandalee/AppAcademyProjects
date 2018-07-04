DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_reply_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Jing', 'Xia'),
  ('Amanda', 'Lee'),
  ('Jennifer', 'Kennedy'),
  ('Alex', 'Abrams');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('How to use SQL', 'How do I open the SQLite command line shell in Terminal?', (SELECT id FROM users WHERE fname = 'Jing' AND lname = 'Xia')),
  ('How to use Ruby', 'How do I use pry to load Ruby in Terminal?', (SELECT id FROM users WHERE fname = 'Amanda' AND lname = 'Lee'));

INSERT INTO
  replies (question_id, user_id, body, parent_reply_id)
VALUES
  (1, 1, 'This is my first reply, exciting!', NULL),
  (2, 2, 'Second reply!!', NULL),
  (1, 2, 'User 1 is absolutely correct.', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 2);
