# frozen_string_literal: true

class PostgresqlLengthOfStringValidator < ActiveModel::Validator
  DEFAULT_STRING_LENGTH = 1000

  def validate(record)
    record.attribute_names.each do |attr_name|
      next if record.instance_eval(attr_name).nil?

      next unless record.column_for_attribute(attr_name).type == :string

      symbol_attr = attr_name.parameterize.underscore.to_sym

      next if record.class.validators_on(symbol_attr).select { |v| v.is_a? ActiveRecord::Validations::LengthValidator }.any?

      permited_length = record.class.columns_hash[attr_name].limit || DEFAULT_STRING_LENGTH
      new_length = record.instance_eval(attr_name).length

      if new_length > permited_length.to_i
        record.errors.add attr_name, "too long, #{permited_length.to_i} characters is the maximum allowed"
      end
    end
  end
end
