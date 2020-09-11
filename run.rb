#!/usr/bin/env ruby
# frozen_string_literal: true
require_relative 'config'
require_relative 'azure_processor'

# Capture environment variables.
config = ProcessorConfig.new

# Process projects in the organisation.
AzureProcessor.new(config).process
