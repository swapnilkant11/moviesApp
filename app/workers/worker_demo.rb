class WorkerDemo
    include Sidekiq::Worker
    def perform(payload)
       @movie_id =  Movie.find(payload[:movie_id])
       @movie_title = @movie_id.title
       @remindtime = payload[:reminder_datetime].localtime
       @user_id = User.find(payload[:user_id])
       @username = @user_id.email

       byebug
 
       p "----"
       puts @movie_title
       p "****"
       puts @remindtime
       p "&&&"
       puts @username

       notifier = Slack::Notifier.new ENV['SLACK_NOTIFIER_WEBHOOK'] do
        defaults channel: ENV['SLACK_NOTIFIER_CHANNEL'],
                username: "swapnilkant"
        end
        payload = {"text": "Hi!! #{@username} your movie #{@movie_title} is about to start at #{@remindtime}, please do watch it!"}
        notifier.ping payload
    end
end