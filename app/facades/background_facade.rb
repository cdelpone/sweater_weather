class BackgroundFacade
  class << self
    def image_data(location)
      image = ImagesService.search_by_location(location)

      results = image[:results].first

      Image.new(results)
    end

    # def image_obj(image)
    # end
  end
end
