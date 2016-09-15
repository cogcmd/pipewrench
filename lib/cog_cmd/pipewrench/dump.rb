#!/usr/bin/env ruby

require 'cog/command'

class CogCmd::Pipewrench::Dump < Cog::Command
  def run_command
    response.template = "dump"

    Cog::Response.log(:info, dump_environment.to_s)
    content = {}
    content["env"]   = dump_environment if request.options['env'] || request.options == {}
    content["input"] = request.input    if request.options['input'] || request.options == {}

    response.content = content
  end

  def dump_environment
    ENV.to_h.map{|k,v| {name: k, value: v}}.sort_by{|e| e[:name]}
  end

end
