module BB
  class SessionFailure
    def self.call env
      [ 302, { 'Content-Type' => 'text/html', 'Location' => '/session/new' }, '' ]
    end
  end
end