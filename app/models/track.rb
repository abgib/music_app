# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  song_type  :string(255)      not null
#  lyrics     :text
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  SONG_TYPES = %w{ bonus regular }

  validates :album_id, :song_type, presence: true
  validates :song_type, inclusion: { in: SONG_TYPES }
end
