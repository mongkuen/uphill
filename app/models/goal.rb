class Goal < ActiveRecord::Base
  SCHEDULE = ["daily", "weekly", "biweekly"]

  belongs_to :user
  has_many :checkins, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 255 }
  validates :schedule, inclusion: { in: SCHEDULE,
    message: "Requires valid schedule" }

  after_commit(on: :create) do
    self.class.create_checkin(self)
  end

  def self.goal_checkin_update
    Goal.all.each do |goal|
      if goal.schedule == SCHEDULE[0] #daily
        create_checkin(goal) if goal.checkins.last.created_at < 0.5.day.ago
      elsif goal.schedule == SCHEDULE[1] #weekly
        create_checkin(goal) if goal.checkins.last.created_at < 6.5.day.ago
      else #biweekly
        create_checkin(goal) if goal.checkins.last.created_at < 13.5.day.ago
      end
    end
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

  private
  def self.create_checkin(goal)
    Checkin.create(goal: goal, user: goal.user, token: generate_token)
  end

  def self.generate_token
    begin
      token = SecureRandom.hex[0, 16]
    end while Checkin.exists?(token: token)
    return token
  end

end
