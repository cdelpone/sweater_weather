class Image
  attr_reader :id,
              :raw_url,
              :location,
              :credit

  def initialize(data, location)
    @raw_url = data[:urls][:raw]
    @location = location[:location]
    @credit = {
      photographer: data[:user][:name],
      photographer_profile_link: data[:user][:links][:html],
      source: source
    }
  end

  def source
    "https://unsplash.com/"
  end

  def set_id(integer)
    @id = integer
  end
end
