desc "Updated all feeds"
task :update_feeds => [:environment] do
  Feed.update_all
  puts "All feeds updated"
end

desc "Sends recommendations"
task :send_recommendations => [:environment] do
  Recommendation.generate_all
  puts "All recommendation sent"
end