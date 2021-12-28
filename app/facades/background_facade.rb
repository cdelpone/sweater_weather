class BackgroundFacade
  class << self
    def image_data(location)
      image = ImagesService.search_by_location(background_params)
      Image.new(image)
    end
  end
end
