require 'sequel'
require 'yaml'
require 'erb'

db_config = File.expand_path('../../db/config.yml', File.dirname(__FILE__))
Sequel.connect(YAML.safe_load(ERB.new(File.read(db_config)).result))

require 'rutodo/database/todo'
require 'rutodo/database/todoservice'
