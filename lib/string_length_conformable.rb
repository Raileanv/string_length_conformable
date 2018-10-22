# frozen_string_literal: true

require 'string_length_conformable/version'
require 'string_length_conformable/mysql_length_of_string_validator'
require 'string_length_conformable/postgresql_length_of_string_validator'

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    class NotImplementedForDb < StandardError; end
    def self.acts_as_string_length_conformable
      if ActiveRecord::Base.connection.adapter_name == 'MySQL'
        validates_with MysqlLengthOfStringValidator
      elsif ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        validates_with PostgresqlLengthOfStringValidator
      else
        text = <<-TEXT
          Unfortunately #{ActiveRecord::Base.connection.adapter_name} is not supported yet,
          please create an issue #{https://github.com/Yaponcik/string_length_conformable/issues},
          or pull request!
        TEXT
        railse NotImplementedForDb, text
      end
    end
  end
end
