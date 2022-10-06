# frozen_string_literal: true

require "zeitwerk"
require "date"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module Playdate
  class Error < StandardError; end
  # Your code goes here...
end
