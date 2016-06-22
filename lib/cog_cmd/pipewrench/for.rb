#!/usr/bin/env ruby

require 'cog/command'

class CogCmd::Pipewrench::For < Cog::Command
  def run_command
    response.content = []

    if (request.args.size >= 3) && request.args[1].match(/\A(in|as)\z/i)
      field_name = request.args[0]
      response.content = request.args[2..-1].map { |value| { field_name => value }}
    else
      response.content = <<-EOF.gsub(/\^\s+/, "")
      ```
      Usage: pipewrench:for <field> in <value1> .. <valueN>

      Example Pipeline:
        pipewrench:for member in neil geddy alex | raw

      Example Output:
        [{"member": "neil"}, {"member", "geddy"}, {"member": "alex"}]
      ```
      EOF
    end
  end
end
