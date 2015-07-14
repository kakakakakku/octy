require 'octokit'
require 'octy/printer'

module Octy

  class Core

    def initialize
      options = {
        access_token: ENV['GITHUB_ACCESS_TOKEN']
      }
      @client = Octokit::Client.new(options)
    end

    def changelog(repo, from, to)
      comparison = @client.compare(repo, from, to)
      commits = comparison.commits.reverse
      commits.map do |commit|
        message = commit.commit.message
        if is_merge_pr?(message)
          pr_id = get_pr_id(message)
          pr = @client.pull_request(repo, pr_id)
          Printer.output(pr) if !pr.nil?
        end
      end
    end

    private

    def is_merge_pr?(message)
      message.index('Merge pull request')
    end

    def get_pr_id(message)
      pr_id = message.split[3]
      pr_id.slice!(0)
      pr_id
    end

  end

end
