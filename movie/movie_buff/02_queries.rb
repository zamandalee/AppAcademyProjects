def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.where('yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5').select(:id, :title, :yr, :score)
end

def bad_years #difficult
  # List the years in which a movie with a rating above 8 was not released.
  Movie.group(:yr).having('MAX(score) < 8').pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .joins(:movies)
    .where('movies.title = ?', title)
    .order('ord asc')
    .select(:id, :name)
end

def vanity_projects #difficult
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie.select(:id, :title, :'actors.name').joins(:director, :castings).where('director_id = actor_id AND ord = 1')
end

def most_supportive #difficult, HAVING must have aggregate!
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor.select(:id, :name, 'COUNT(castings.*) AS roles').joins(:castings).group(:id).where('castings.ord != 1').order('roles desc').limit(2)
end
