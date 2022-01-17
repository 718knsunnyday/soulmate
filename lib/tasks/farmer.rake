namespace :farmer do
  desc "farmer" 
  task :save_farmer => :environment do
    farmer = Farmer.create
    puts 
  end
end
