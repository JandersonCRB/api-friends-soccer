# frozen_string_literal: true

p "Start Seeding"

p "Seeding common records"
Dir[File.join(Rails.root, "db", "seeds/common", "*.rb")].sort.each do |seed|
  p "Seeding for #{File.basename(seed, ".*")}"
  load seed
end

p "Seeding env records"

Dir[File.join(Rails.root, "db", "seeds/#{Rails.env.downcase}", "*.rb")].sort.each do |seed|
  p "Seeding for #{File.basename(seed, ".*")}"
  load seed
end

p "Done Seeding"
