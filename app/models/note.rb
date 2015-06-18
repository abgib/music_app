# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  track_id    :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  track_notes :text
#

class Note < ActiveRecord::Base
  validates :user_id, :track_id, :track_notes, presence: true

  
end
