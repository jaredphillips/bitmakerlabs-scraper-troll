require "nokogiri"
require "open-uri"
require "openssl"

puts "User Name Database Started"
File.open('users.txt', 'w') do |f|
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  page = Nokogiri::HTML(open("https://github.com/bitmakerlabs?tab=members"))
  user_names = page.css("h4 a")
  user_names.text.downcase
  puts user_names
  user_names.each do |user_name|
    user_name = user_name.text[/\w[\w\s]*/].downcase
    f.write(user_name + "\n") if !user_name.nil? 
  end
end
puts "User Name Database Finished"
