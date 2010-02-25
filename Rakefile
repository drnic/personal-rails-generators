require "rake"
require "fileutils"

desc "Import assets"
task :assets do
  FileUtils.chdir(File.dirname(__FILE__)) do
    sh "curl -L http://code.jquery.com/jquery-1.4.2.min.js > app_layout/templates/javascripts/jquery.js"
    sh "curl -L http://github.com/github/jquery-relatize_date/raw/master/jquery.relatize_date.js > app_layout/templates/javascripts/jquery.relatize_date.js"
  end
end

