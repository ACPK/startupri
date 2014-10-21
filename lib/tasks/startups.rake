task :new_startups => :environment do
    Startup.getAngellist
    Startup.GetCrunchbase
end