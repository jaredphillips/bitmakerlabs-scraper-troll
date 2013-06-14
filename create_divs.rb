require 'rubygems'
require 'nokogiri'
require 'open-uri'

File.open('index.html', 'w') do |html|
  user_and_stat = []
  File.open("users_and_score.txt", "r") do |txt|
    while (line = txt.gets)
      user_and_stat << [line.chomp, txt.gets.to_i]
    end
  end
  user_and_stat.reverse!

# creation of the html doc

  html.write("<html>")
  html.write("<head>")
  html.write("<link rel='stylesheet' type='text/css' href='style.css'>")
  html.write("<link href='http://fonts.googleapis.com/css?family=Lily+Script+One' rel='stylesheet' type='text/css'>")
  html.write("<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>")
  html.write("<title>Github Pride</title>")
  html.write("</head>")
  html.write("<body>")
  html.write("<h1>Always be pushing...</h1>")
  html.write("\n")
  html.write("<h3>               ...you never know who will be scraping</h3>")

  user_and_stat.map! do |lines|
    lines.map! do |line|
      html.write("<div class='name'>\n")
      html.write(line.to_s)
      html.write("</div>\n")
      end
    html.write("</body>")
    html.write("</html>")
  end
end
