Warden::JWTAuth.configure do |config|
  config.secret = "e5eedc041b64ded3fb975e61d122f17256094084ac5c5b429c2f589dba7cdd57089ab3b3e9c8009b62a16a2a637feb340603f94bcd0df2edfe721208fec34f3b"#ENV['DEVISE_JWT_SECRET_KEY']
  config.dispatch_requests = [
                               ['POST', %r{^/api/login$}],
                               ['POST', %r{^/api/login.json$}]
                             ]
  config.revocation_requests = [
                                 ['DELETE', %r{^/api/logout$}],
                                 ['DELETE', %r{^/api/logout.json$}]
                               ]
end