class Image
  attr_reader :raw_url,
              :photographer,
              :photographer_profile_link,
              :source

  def initialize(data)
    @raw_url = data[:urls][:raw]
    @photographer = data[:user][:name]
    @photographer_profile_link = data[:user][:links][:html]
    # @photographer_profile_link = photographer_profile_link
    @source = source
  end

  # def user(data)
  #   user = data[:user]
  # end

  # def photographer
  #   user[:name]
  # end
  #
  # def photographer_profile_link
  #   @user[:links][:html]
  # end

  def source
    "https://unsplash.com/"
  end
end
