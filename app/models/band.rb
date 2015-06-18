# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
  has_many(
    :albums,
    class_name: 'Album',
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )

  validates :name, presence: true, uniqueness: true

end
