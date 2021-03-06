namespace :rutodo do
  desc 'Migrate Rutodo database.'
  task :migrate do
    require 'sequel'
    require 'yaml'
    require 'erb'

    Sequel.extension :migration

    db_config = File.expand_path('../../../db/config.yml', File.dirname(__FILE__))
    DB = Sequel.connect(YAML.safe_load(ERB.new(File.read(db_config)).result))

    Sequel::Migrator.run(DB, File.expand_path('../../../db/migrations', File.dirname(__FILE__)))

    puts 'Migration finished.'
  end
end
