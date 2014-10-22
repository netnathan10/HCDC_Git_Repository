require 'mechanize'

web_page = ''
boxes = []
csv_text = File.read('sample_user_creds.csv')
csv = CSV.parse(csv_text, :headers => true)

# Create a new mechanize variable
mechanize = Mechanize.new

page = mechanize.get(web_page)

form = page.forms.first

boxes.each do |box|
  form[box]
end

counter = 0
csv.each do |row|

  puts "Username: #{row[username]}, Password: #{row[password]}"
  boxes[counter]
  counter += 1
end
form['box_to_fill'] = 'stuff to enter'

page = form.submit

page.search('#top-results h3').each do |h3|
  puts h3.text.strip
end