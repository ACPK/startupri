task :new_startups => :environment do
    Startup.getAngellist
    Startup.getCrunchbase
end