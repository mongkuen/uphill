class Checkin < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  after_commit(on: :create) do
    ApplicationMailer.checkin_email(self).deliver_later if self.goal.notify
  end

end
