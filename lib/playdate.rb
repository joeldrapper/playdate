# frozen_string_literal: true

require "zeitwerk"
require "date"
require "i18n"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup


I18n.load_path += Dir[File.expand_path("playdate/locales", __dir__) + "/*.yml"]

module Playdate
  class Error < StandardError; end
  # Your code goes here...
end
