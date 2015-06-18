# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  style_type :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  STYLE_TYPE = %w{ live studio }

  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id
  )

  validates :band_id, :style_type, :title, presence: true
  validates :style_type, inclusion: { in: STYLE_TYPE }
end
