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
      m.file 'application.html.haml',  "app/views/layouts/application.html.haml"
      m.file '_header.html.haml',  "app/views/layouts/_header.html.haml"
      m.file '_navigation.html.haml',  "app/views/layouts/_navigation.html.haml"
      m.file '_footer.html.haml',  "app/views/layouts/_footer.html.haml"
      m.file 'application_helper.rb', "app/helpers/application_helper.rb", :collision => :force
      if options[:use_css]
        m.file 'stylesheets/style.css',         "public/stylesheets/style.css"
        m.file 'stylesheets/reset.css',         "public/stylesheets/reset.css"
        m.file 'stylesheets/enrichment.css',    "public/stylesheets/enrichment.css"
        m.file 'images/logo.png',               "public/images/logo.png"
        m.file 'images/footer-logo.png',               "public/images/footer-logo.png"
        m.file 'images/footer.png',             "public/images/footer.png"
      end
      m.file 'favicon.ico',                         "public/favicon.ico", :collision => :force
      m.file 'javascripts/jquery.js',               "public/javascripts/jquery.js"
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
