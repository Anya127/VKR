# Положить в lib/tasks/
# Запускать: bundle exec rake import:one_day
namespace :import do
  desc "Загрузка календаря"
  task(:one_day => :environment) do
    puts "Перевод на следующий семестр"
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 1)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 2)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 3)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 4)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 5)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 6)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 7)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 1, 8)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 2, 23)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 3, 8)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 3, 9)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 4, 28)).first
    c.is_output = false
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 4, 29)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 4, 30)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 5, 1)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 5, 2)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 5, 9)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 6, 9)).first
    c.is_output = false
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 6, 11)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 6, 12)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 11, 5)).first
    c.is_output = true
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 12, 29)).first
    c.is_output = false
    c.save
    c = Calendar.where(year_c: 2018, date_c: Date.new(2018, 12, 31)).first
    c.is_output = true
    c.save
  end
end
