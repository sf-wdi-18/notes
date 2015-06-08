require('pg')

conn = PG.connect(dbname: 'friends_example')

conn.exec("SELECT * FROM biking_friends") do |res|
  res.each do |row|
    p row
  end
end



