class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    # songs = self.albums.joins(:tracks)
    #   .select('tracks.title', 'COUNT(tracks.id) AS count')
    #   .group('tracks.id')

    counter = Hash.new(0)

    albums = self.albums.includes(:tracks)
    albums.each do |album|
      album.tracks.each do |track|
        counter[album.title] += 1
      end
    end
    p albums.first.tracks
    # p albums.first
    p counter

  end
end
