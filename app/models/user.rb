class User < ActiveRecord::Base
  has_secure_password
  has_many :goals, dependent: :destroy
  has_many :checkins, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, length: {minimum: 5}, confirmation: true, on: :create

  after_commit(on: :create) do
    WelcomeMailer.welcome_email(self).deliver_now
  end

end
