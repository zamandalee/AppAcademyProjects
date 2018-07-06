# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'u1')
User.create(username: 'u2')
User.create(username: 'u3')

Poll.create(title: 't1', author_id: 1)
Poll.create(title: 't2', author_id: 2)
Poll.create(title: 't3', author_id: 2)

Question.create(text: 'q1', poll_id: 1)
Question.create(text: 'q2', poll_id: 1)
Question.create(text: 'q3', poll_id: 2)
Question.create(text: 'q4', poll_id: 3)
Question.create(text: 'q5', poll_id: 3)

AnswerChoice.create(text: 'a1', question_id: 1)
AnswerChoice.create(text: 'a2', question_id: 1)
AnswerChoice.create(text: 'a3', question_id: 2)
AnswerChoice.create(text: 'a4', question_id: 3)
AnswerChoice.create(text: 'a5', question_id: 4)
AnswerChoice.create(text: 'a6', question_id: 5)
AnswerChoice.create(text: 'a7', question_id: 5)

Response.create(user_id: 1, answer_choice_id: 1)
Response.create(user_id: 1, answer_choice_id: 2)
Response.create(user_id: 1, answer_choice_id: 3)
Response.create(user_id: 2, answer_choice_id: 1)
Response.create(user_id: 2, answer_choice_id: 2)
Response.create(user_id: 3, answer_choice_id: 1)
Response.create(user_id: 3, answer_choice_id: 3)