require "string_length_conformable/version"

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    class NotMysqlDb < StandardError; end
    def self.acts_as_string_length_conformable

      unless ActiveRecord::Base.connection.instance_of? ActiveRecord::ConnectionAdapters::MysqlAdapter
        raise NotMysqlDb, 'Please use this gem with mysql. But better use PostgreSQL and be happy!'
      end

      validates_with LengthOfStringValidator
    end
    class LengthOfStringValidator < ActiveModel::Validator
      def validate(record)
        record.attribute_names.each do |attr_name|

          next if record.instance_eval(attr_name).nil?

          next unless record.column_for_attribute(attr_name).type == :string

          symbol_attr = attr_name.parameterize.underscore.to_sym

          next if record.class.validators_on(symbol_attr).select { |v| v.class == ActiveRecord::Validations::LengthValidator}.any?

          permited_length = record.class.columns_hash[attr_name].limit
          new_length = record.instance_eval(attr_name).length

          if new_length > permited_length.to_i
            record.errors.add attr_name, "too long, #{permited_length.to_i} characters is the maximum allowed"
          end
        end
      end
    end
  end
end
