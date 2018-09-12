require 'sqlite3'
require_relative 'question'

class Reply
  attr_accessor :question_id, :user_id, :parent_reply_id, :body
  attr_reader :id

  def self.find_by_id(id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    child_ids = QuestionDBConnection.instance.execute('SELECT id FROM replies WHERE parent_reply_id = @id')
    child_ids.map do |child_id|
      Reply.find_by_id(child_id)
    end
  end

end
