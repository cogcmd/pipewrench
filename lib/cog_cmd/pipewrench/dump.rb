#!/usr/bin/env ruby

require 'cog/command'
require 'text-table'

class CogCmd::Pipewrench::Dump < Cog::Command
  def run_command
    body = ""
    body += dump_environment if request.options['env'] || request.options == {}
    body += dump_input if request.options['input'] || request.options == {}

    response.template = "preformatted"
    response['body'] = body
  end

  def dump_environment
    table = Text::Table.new
    table.head = [ 'Name', 'Value' ]
    ENV.each { |k,v| table.rows << [ k, v ] }
    return <<EOF
Environment Variables:

#{table.to_s}
EOF
  end

  def dump_input
    return <<EOF
Pipeline Input:

#{request.input.to_s}
EOF
  end
end
