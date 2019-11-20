require('pry')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new(
  {
    'first_name' => 'Kanye',
    'last_name' => 'West'
  }
)

artist1.save()

album1 = Album.new({
  'title' => 'The College Dropout',
  'genre' => 'Rap',
  'artist_id' => artist1.id
  })

album1.save

binding.pry

nil
