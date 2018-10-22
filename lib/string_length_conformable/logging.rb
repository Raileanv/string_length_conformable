# frozen_string_literal: true

module Logging
  def log
    text = <<-TEXT
      \n
      #{'*' * 100}
      String is validated by gem string_length_conformable.
      for more info visit https://github.com/Yaponcik/string_length_conformable
      #{'*' * 100}
    TEXT
    Logger.new(STDOUT).info text
  end
end
