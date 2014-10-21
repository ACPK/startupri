task :new_startups => :environment do
    Startup.getAngellist
end