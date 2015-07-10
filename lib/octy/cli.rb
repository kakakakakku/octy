require 'thor'
require 'octokit'
require 'octy/core'

module Octy

  class CLI < Thor

    desc 'gen', 'Generate sample host name by mnemonic wordlist.'
    method_options repo: :string
    method_options from: :string
    method_options to: :string

    def changelog
      begin
        octy = Octy::Core.new
        octy.changelog(options[:repo], options[:from], options[:to])
      rescue => e
        puts e.message
      end
    end

  end

end
