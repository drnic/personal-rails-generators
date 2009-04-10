class DatabaseYmlMysqlGenerator < Rails::Generator::Base
  
  attr_accessor :app_name
  
  def manifest
    record  do |m|
      @app_name = File.basename(File.expand_path(RAILS_ROOT))
      m.template 'database.yml', 'config/database.yml'
    end
  end
end
