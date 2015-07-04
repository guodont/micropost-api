namespace :data do
  task :create_microposts => [:environment] do
    user = User.find(1)
    100.times do |i|
      Micropost.create(user_id: user.id, title: "title-#{i}", content: "content-#{i}")
    end
  end

  task :create_users => [:environment] do
    100.times do |i|
      User.create()
    end
  end
end