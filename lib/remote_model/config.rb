module RemoteModel
  class << self
    attr_accessor :remote_url
    
    def configure
      yield self
    end
  end
end
