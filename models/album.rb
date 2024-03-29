require_relative('../db/sql_runner')
require_relative('artist')

class Album
attr_accessor :name, :num_of_songs
attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def save
    sql = "INSERT INTO albums (title , genre, artist_id) VALUES ($1,$2,$3) RETURNING id;"

    values = [@title, @genre,@artist_id]
    result = SqlRunner.run(sql,values)

    @id = result[0]['id'].to_i
  end

  def artist
    sql = "SELECT FROM artists where id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql,values)
    return Artist.new(artist)
  end

end
