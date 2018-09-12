require 'sqlite3'
require_relative 'question'

class QuestionFollow
  attr_reader :user_id, :question_id

  def self.followers_for_question_id(question_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows
        JOIN users ON users.id = question_follows.user_id
        JOIN questions ON questions.id = question_follows.question_id
      WHERE
        question_id = ?
    SQL

    users.map {|user| User.new(user)}
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_follows
        JOIN users ON users.id = question_follows.user_id
        JOIN questions ON questions.id = question_follows.question_id
      WHERE
        user_id = ?
    SQL

    questions.map {|q| Question.new(q)}
  end

  def self.most_followed_questions(n)
    questions = QuestionDBConnection.instance.execute(<<-SQL,n)
      SELECT
        questions.*
      FROM
        question_follows
        JOIN users ON users.id = question_follows.user_id
        JOIN questions ON questions.id = question_follows.question_id
      GROUP BY questions.id
      ORDER BY COUNT(question_follows.question_id) DESC
      LIMIT ?
    SQL

    questions.map {|q| Question.new(q)}
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end



end
