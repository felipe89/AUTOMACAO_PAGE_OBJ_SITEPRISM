 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'site_prism'
 require_relative 'page_helper.rb'

 BROWSER = ENV['BROWSER']
 AMBIENTES = ENV['AMBIENTE']

 CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTES}.yml")

 World(PageObjects)
 
 Capybara.register_driver :selenium do |app|
      
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, :browser => :chrome,)
  elsif BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new(app, :browser => :chrome, 
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chormeOptions' => {'args' =>['--headless', 'disable-gpu']}
      )
      )

  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?('firefox_headless')
    browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    Capybara::Selenium::Driver.new(app, :browser => :firefox, options: browser_options)




  # elsif BROWSER.eql?('ie')
  #   options = {js_errors: false}
  #   Capybara::Selenium::Driver.new(app, :browser => :internet_explore,)
  end

end
    
Capybara.configure do |config|
  config.default_driver = :selenium #selenium_chrome #selenium_chrome_headless
  config.app_host = CONFIG['url_padrao'] #Carregar url do yml confirme parametro informado acima
                    CONFIG['user'] #Carregar user criado dentro do yml
  config.default_max_wait_time = 5
 end

 