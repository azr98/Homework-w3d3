require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :first_name, :last_name
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def self.all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def save
    sql = "INSERT INTO artists (first_name,last_name) VALUES ($1,$2) RETURNING id"
    values = [@first_name,@last_name]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def albums
    sql = "SELECT * FROM albums where artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql,values)
    return albums.map{|album| Album.new(album)}
  end

end
