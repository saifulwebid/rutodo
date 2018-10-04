require 'sequel'
require 'yaml'
require 'erb'

db_config = File.expand_path('../../db/config.yml', File.dirname(__FILE__))
Sequel.connect(YAML.load(ERB.new(File.read(db_config)).result))

require 'todolist/database/todo'
require 'todolist/database/todoservice'
