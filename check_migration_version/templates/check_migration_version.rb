current_version = ActiveRecord::Migrator.current_version rescue 0

highest_version = Dir.glob("#{RAILS_ROOT}/db/migrate/*.rb").map { |f|
  f.match(/(\d+)_.*\.rb$/) ? $1.to_i : 0
}.max || 0

unless defined?(Rake) # skip when run from tasks like rake db:migrate
  if current_version != highest_version
    abort "Expected migration version #{highest_version}, got #{current_version}"
  end
end
