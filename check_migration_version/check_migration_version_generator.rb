class CheckMigrationVersionGenerator < Rails::Generator::Base

  default_options :use_css => true

  attr_reader :name, :application

  def initialize(runtime_args, runtime_options = {})
    super
    @name = '.'
    @application = File.basename(destination_root)
  end

  def manifest
    record do |m|
      m.template 'check_migration_version.rb',  "config/initializers/check_migration_version.rb"
    end
  end

  def add_options!(opt)
    # opt.separator ''
    # opt.separator 'Options:'
    # opt.on("--no-css", "Don't create css file") { |v| options[:use_css] = false }
  end

end
