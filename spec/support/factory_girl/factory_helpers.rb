module FactoryHelpers
  def random_time_in_past
    days_rand = rand(29) + 1
    minutes_rand = rand(360) + 1
    days_ago = days_rand.days.ago.to_f
    minutes_ago = minutes_rand.minutes.ago.to_f
    Time.at((days_ago - minutes_ago) + minutes_ago)
  end
end

FactoryGirl::SyntaxRunner.send(:include, FactoryHelpers)
