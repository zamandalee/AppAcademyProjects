require_relative 'question'
# CREATE TABLE question_likes (
#   id INTEGER PRIMARY KEY,
#   user_id INTEGER NOT NULL,
#   question_id INTEGER NOT NULL,
#
#   FOREIGN KEY (user_id) REFERENCES users(id),
#   FOREIGN KEY (question_id) REFERENCES questions(id)
# );

class QuestionLike
  attr_reader :user_id, :question_id

  def self.likers_for_question_id(question_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
        JOIN users ON users.id = question_likes.user_id
        JOIN questions ON questions.id = question_likes.question_id
      WHERE
        question_id = ?
    SQL

    users.map {|user| User.new(user)}
  end

  def self.num_likes_for_question_id(question_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(users.id)
      FROM
        question_likes
        JOIN users ON users.id = question_likes.user_id
        JOIN questions ON questions.id = question_likes.question_id
      WHERE
        question_id = ?
    SQL

    users.first.values.first
  end

  def self.num_likes_for_user_id(user_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        COUNT(users.id)
      FROM
        question_likes
        JOIN users ON users.id = question_likes.user_id
        JOIN questions ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL

    users.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
        JOIN users ON users.id = question_likes.user_id
        JOIN questions ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL

    questions.map {|q| Question.new(q)}
  end

  def self.most_liked_questions(n)
    questions = QuestionDBConnection.instance.execute(<<-SQL,n)
      SELECT
        questions.*
      FROM
        question_likes
        JOIN users ON users.id = question_likes.user_id
        JOIN questions ON questions.id = question_likes.question_id
      GROUP BY questions.id
      ORDER BY COUNT(question_likes.question_id) DESC
      LIMIT ?
    SQL

    questions.map {|q| Question.new(q)}
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
