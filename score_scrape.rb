require "nokogiri"
require "open-uri"
require "openssl"

data = File.read("users.txt")
users = data.split("\n")
users_and_score = {}
users.each do |user|
  link = "https://github.com/#{user}" 
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  page = Nokogiri::HTML(open(link))
  stat = page.css("span.num").first.text.tr('A-Za-z', '').to_i
  users_and_score[user] = stat
end
puts "Starting sort"
users_and_score = users_and_score.sort_by { |key, value| value }
puts "Finished sort, starting write to file"
File.open('users_and_score.txt', 'w') do |f|
  users_and_score.each do |user, stat|
    f.write(user + "\n")
    f.write(stat.to_s + "\n")
  end
end