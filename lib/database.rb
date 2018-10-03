require 'sequel'
require 'yaml'

db_config = File.join(File.dirname(__FILE__), '../db/config.yml')
Sequel.connect(YAML.load(File.read(db_config)))

require 'database/todo'
