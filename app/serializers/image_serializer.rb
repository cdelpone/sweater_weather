class ImageSerializer
  include JSONAPI::Serializer

  attributes  :location,
              :raw_url,
              :credit,
              :source,
              :photographer,
              :photographer_profile_link
end
