Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret),
	{
		:secure_image_url => 'true',
		:image_size => 'original',
		:authorize_params => {
		#   :force_login => 'true',
		#   :lang => 'pt'
		}
	  }
end