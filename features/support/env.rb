 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'site_prism'
 require_relative 'page_helper.rb'

 AMBIENTES = ENV['AMBIENTE']

 CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTES}.yml")

 World(PageObjects)

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG['url_padrao'] #Carregar url do yml confirme parametro informado acima
                    CONFIG['user'] #Carregar user criado dentro do yml
  config.default_max_wait_time = 5
 end

 