module Octy

  class Printer

    def self.output(pr)
      print sprintf("* [#%s](%s) %s [コミッター:%s]\n", pr[:number], pr[:_links][:html][:href], pr[:title], pr[:user][:login])
    end

  end

end
