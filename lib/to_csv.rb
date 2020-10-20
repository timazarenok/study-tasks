require 'csv'

class ToCsv
  def self.to_csv(file_name, array)
    CSV.open(file_name + '.csv', 'w') do |csv|
      csv << %w[Name Label Image]
      array.each do |item|
        csv << [item[:name], item[:text], item[:image]]
      end
    end
  end
end