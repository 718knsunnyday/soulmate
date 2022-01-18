namespace :farmer do
  desc "farmer作成"
  task :farmer_user, ['last_name','first_name','last_name_kana','first_name_kana','email','password','password_confirmation'] => :environment do |_,args|
    Farmer.create!(
      last_name: args.last_name,
      first_name: args.first_name,
      last_name_kana: args.last_name_kana,
      first_name_kana: args.first_name_kana,
      email: args.email,
      password: args.password,
      password_confirmation: args.password_confirmation
    )
    puts "#{args.last_name}を作成"
  end
end
