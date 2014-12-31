Rails.application.config.middleware.use OmniAuth::Builder do
  provider OmniAuth::Strategies::GoogleOauth2, '411233905521-7moqj1grkqda3s65gapsp9du61mmb66a.apps.googleusercontent.com', '4NADsEZvTxIKFLSRluaKQ100'
end