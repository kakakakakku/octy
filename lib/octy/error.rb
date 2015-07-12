module Octy

  class InvalidAccessTokenError < StandardError
    def initialize
      super('Invalid access token provided')
    end
  end

  class InvalidResourceError < StandardError
    def initialize
      super('Invalid resource (repository, branch, tag) given')
    end
  end

end
