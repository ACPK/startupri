task :new_events => :environment do
    Event.getMeetups
    Event.getEventbrites
end