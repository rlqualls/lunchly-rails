module FactoryHelpers
  def random_time_in_past
    days = rand(15) + 1
    minutes = rand(360) + 1
    Time.at((days.days.ago.to_f - minutes.minutes.ago.to_f) + minutes.minutes.ago.to_f)
  end
end

FactoryGirl::SyntaxRunner.send(:include, FactoryHelpers)
