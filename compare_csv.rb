require 'csv'

old_dataset = CSV.read("upvsdataset.csv", headers: true)
new_dataset = CSV.read("zoznamovmsaktivovanouschrankou.csv", headers: true)

arr = []

old_dataset.each do |row|
  unless new_dataset.by_col[2].include?(row[9])
    arr << [row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]]
  end
end

CSV.open("records_missing_in_new_dataset.csv", "w") do |csv|
  arr.each do |el|
    csv << el
  end
end