class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :checkins, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 255 }
  validates :schedule, inclusion: { in: ["daily", "weekly", "biweekly"],
    message: "Requires valid schedule" }

  after_commit(on: :create) do
    Checkin.create(goal: self, user: self.user)
  end

  def uphill
    self.checkins.where(status: "up").count
  end

  def downhill
    self.checkins.where(status: "down").count
  end

  def stationary
    self.checkins.where(status: "none").count
  end

  def total_records
    self.checkins.count
  end

  def total_checkins
    self.total_records - self.checkins.where(status: nil).count
  end

  def percentage
    self.uphill.to_f / (self.downhill + self.uphill).to_f
  end

  def status?
    if !self.checkins.last.nil?
      status ||= self.checkins.last.status
    else
      false
    end
  end

end
