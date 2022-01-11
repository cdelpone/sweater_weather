class Image
  attr_reader :raw_url,
              :photographer,
              :photographer_profile_link,
              :source

  def initialize(data)
    @raw_url = data[:urls][:raw]
    @photographer = data[:user][:name]
    @photographer_profile_link = data[:user][:links][:html]
    @source = source
  end

  def source
    "https://unsplash.com/"
  end
end
