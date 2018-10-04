require 'sequel'
require 'yaml'
require 'erb'

db_config = File.join(File.dirname(__FILE__), '../db/config.yml')
Sequel.connect(YAML.load(ERB.new(File.read(db_config)).result))

require 'database/todo'
require 'database/todoservice'
