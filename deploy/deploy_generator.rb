require 'rbconfig'
require 'digest/md5' 

class DeployGenerator < Rails::Generator::Base
  
  default_options :name => nil, :domain => nil
  
  attr_reader :name, :app_name, :domain
  attr_reader :public_repo, :github_user, :repository
  
  def initialize(runtime_args, runtime_options = {})
    super
    @app_name = File.basename(destination_root)
    extract_options
    @github_user ||= `git config --get github.user`.strip
    
    @repository = "git#{ public_repo ? '://' : '@' }github.com#{ public_repo ? '/' : ':' }#{github_user}/\#{application}.git"
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'config'
      m.directory 'app/views/layouts'

      # Create stubs
      m.template "Capify.erb",  "Capify", :force => true
      m.template "app/views/layouts/maintenance.html.erb",  "app/views/layouts/maintenance.html.erb", :collision => :force
    end
  end

  protected
    def banner
      <<-EOS
Installs a deprec deploy.rb file + maintanence.html.erb page.

USAGE: #{$0} [options]"
EOS
    end

    def add_options!(opts)
      opts.on("-d", "--domain=\"www.somedomain.com\"", String,
              "The applications www domain",
              "Default: none") { |x| options[:domain] = x }
      opts.on("-p", "--public", String,
              "GitHub repository is public, rather than private") { |x| options[:public] = x }
      opts.on("-u", "--github-user", String,
              "GitHub user for target repository",
              "Default: value of github.user from git config") { |x| options[:github_user] = x }
    end
    
    def extract_options
      @domain      = options[:domain]
      @public_repo = options[:public]
      @github_user = options[:github_user]
    end
end