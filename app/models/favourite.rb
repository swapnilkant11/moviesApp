class Favourite < ApplicationRecord
    include Filterable
    belongs_to :user
    belongs_to :movie
    validates :title, presence: true
    validates :imdbID, presence: true
    validates :year, presence: true
    validates :remainder_date, presence: true
    validates :user_id, presence: true
    validates :movie_id, presence: true

    after_create :run_reminder

    def run_reminder
        payload = {
            movie_id: self.movie_id,
            user_id: self.user_id,
            reminder_datetime:  self.remainder_date,
        }
        remindtime = payload[:reminder_datetime].localtime
        WorkerDemo.perform_in(remindtime - 2.minutes, payload)
    end
end
