module RemoteModel
  class << self
    attr_accessor :remote_url, :auth_key
    
    def configure
      yield self
    end
  end
end
