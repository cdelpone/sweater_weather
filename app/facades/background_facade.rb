class BackgroundFacade
  class << self
    def image_data(location)
      image = ImagesService.search_by_location(location)

      Image.new(image, location)
    end
  end
end
