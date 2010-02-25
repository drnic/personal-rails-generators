require "rake"
require "fileutils"

desc "Import assets"
task :assets do
  FileUtils.chdir(File.dirname(__FILE__)) do
    sh "curl -L http://code.jquery.com/jquery-1.4.2.min.js > app_layout/templates/javascripts/jquery.js"
    sh "curl -L http://github.com/github/jquery-relatize_date/raw/master/jquery.relatize_date.js > app_layout/templates/javascripts/jquery.relatize_date.js"
  end
end

desc "Generate sample app_layout page"
task :sample_app_layout do
  sample_file = File.join(File.dirname(__FILE__), "app_layout", "sample.html")
  File.open(sample_file, "w") do |f|
    f << "hi"
  end
  `open #{sample_file}`
end