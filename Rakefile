require "rake"
require "fileutils"

desc "Import assets"
task :assets do
  FileUtils.chdir(File.dirname(__FILE__)) do
    sh "curl -L http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js > app_layout/templates/javascripts/jquery.js"
    sh "curl -L http://jqueryjs.googlecode.com/svn/trunk/plugins/form/jquery.form.js > app_layout/templates/javascripts/jquery.form.js"
    sh "curl -L http://plugins.jquery.com/files/jquery.template.js.txt > app_layout/templates/javascripts/jquery.template.js"
  end
end
