class AppLayoutGenerator < Rails::Generator::Base

  default_options :use_css => true

  attr_reader :name, :application

  def initialize(runtime_args, runtime_options = {})
    super
    @name = '.'
    @application = File.basename(destination_root)
  end

  def manifest
    record do |m|
      m.template 'layout.htmlerb',  "app/views/layouts/#{file_name}.html.erb"
      m.file 'application_helper.rb', "app/helpers/application_helper.rb", :collision => :force
      if options[:use_css]
        m.file 'stylesheets/stylesheet.css',  "public/stylesheets/#{file_name}.css"
        m.file 'stylesheets/form.css',        "public/stylesheets/form.css"
        m.file 'images/indicator_roller.gif', "public/images/indicator_roller.gif"
        m.file 'images/lock.gif',             "public/images/lock.gif"
        m.file 'images/openid.gif',           "public/images/openid.gif"
        m.file 'images/rails.png',            "public/images/rails.gif"
        m.file 'images/rss.gif',              "public/images/rss.gif"
      end
      m.file 'favicon.ico',                         "public/favicon.ico", :collision => :force
      m.file 'javascripts/jquery.js',               "public/javascripts/jquery.js"
      m.file 'javascripts/jquery.template.js',      "public/javascripts/jquery.template.js"
      m.file 'javascripts/jquery.form.js',          "public/javascripts/jquery.form.js"
      m.file 'javascripts/jquery.relatize_date.js', "public/javascripts/jquery.relatize_date.js"
    end
  end

  def file_name
    'application'
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--no-css", "Don't create css file") { |v| options[:use_css] = false }
  end

end
