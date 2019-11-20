require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class AlbumTest < MiniTest::Test

  def test_can_create_album
    album_details = {
      'name' => 'The College Dropout',
      'num_of_songs' => 21
    }

    new_album = Album.new(album_details)
    assert_equal('The College Dropout', new_album.name)
  end

end
