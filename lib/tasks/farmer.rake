namespace :farmer do
  desc "farmer_model" 
  task :task_model => :environment do
    puts Farmer.sa().to_yaml
  end
end
