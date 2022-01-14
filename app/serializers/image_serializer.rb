class ImageSerializer
  include JSONAPI::Serializer

  attributes  :raw_url,
              :credit,
              :location
end
