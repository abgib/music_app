# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
attr_accessor :password
  has_many(
    :notes
  )

  validates :email,
    :session_token,
    presence: true, uniqueness: true

  validates :password_digest,
    presence: { message: "Password can't be blank" }

  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
