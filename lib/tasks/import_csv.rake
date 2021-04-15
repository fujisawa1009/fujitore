require 'csv'

namespace :import_csv do

  desc "gym_data.csvをインポートするタスク"
  task gyms: :environment do
    path = File.join Rails.root, "db/csv_data/gym_data.csv"

    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
         name: row["name"],
         title: row["title"],
         content: row["content"],
         number: row["number"],
         address: row["address"],
         price: row["price"],
         district_id: row["district_id"]
      }
    end
    puts "インポート処理を開始"
    
    begin
      Gym.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end


  desc "district_data.csvをインポートするタスク"
  task districts: :environment do
    path = File.join Rails.root, "db/csv_data/district_data.csv"

    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
         name: row["name"]
      }
    end
    puts "インポート処理を開始"
    
    begin
      District.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end