require 'rbconfig'
require 'digest/md5' 

class DeployGenerator < Rails::Generator::Base
  
  default_options :name => nil, :domain => nil
  
  attr_reader :name, :app_name, :domain
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    @app_name = File.basename(destination_root)
    extract_options
  end

  def manifest
    md5 = Digest::MD5.new
    now = Time.now
    md5 << now.to_s
    md5 << String(now.usec)
    md5 << String(rand(0))
    md5 << String($$)
    md5 << app_name
    
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'config'
      m.directory 'app/views/layouts'

      # Create stubs
      m.template "config/deploy.rb.erb",  "config/deploy.rb", :force => true
      m.template "config/memcached.yml.erb",  "config/memcached.yml", :force => true
      m.template "config/mailer.yml.erb",  "config/mailer.yml", :force => true
      m.template "config/environment.rb.erb", "config/environment.rb", :assigns => { :app_name => @app_name, :app_secret => md5.hexdigest }, :force => true
      m.template "app/views/layouts/maintenance.html.erb",  "app/views/layouts/maintenance.html.erb", :force => true
    end
  end

  protected
    def banner
      <<-EOS
Installs a deprec deploy.rb file + maintanence.rhtml page
for lots of standard behaviour.

USAGE: #{$0} #{spec.name} path"
EOS
    end

    def add_options!(opts)
      # opts.separator ''
      # opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      opts.on("-d", "--domain=\"www.somedomain.com\"", String,
              "The applications www domain",
              "Default: none") { |options[:domain]| }
      # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end
    
    def extract_options
      @domain = options[:domain]
    end
end