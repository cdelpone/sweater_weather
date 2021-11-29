require 'rails_helper'

RSpec.describe 'ImagesService', :vcr do
  before :each do
    location = 'Denver,CO'
    @image_response = ImagesService.image_data(location)
  end
  
  it 'service call is structured as expected' do
    expect(@image_response).to be_a Hash
    expect(@image_response).to have_key(:total)
    expect(@image_response).to have_key(:total_pages)
    expect(@image_response).to have_key(:results)
    expect(@image_response[:results]).to be_an Array
  end

  # it 'returns results data data' do
  #   @response[:results][0] = results
  #
  #   expect(results).to be_a Hash
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #   expect(results).to have_key(:)
  #
  #   expect(results[:]).to be_an Array
  #   expect(results[:][0]).to have_key(:)
  # end
end
# {
#   "total": 3070,
#   "total_pages": 3070,
#   "results": [
#     {
#       "id": "NflJmUuaYVI",
#       "created_at": "2020-10-15T18:26:07-04:00",
#       "updated_at": "2021-11-22T05:21:39-05:00",
#       "promoted_at": null,
#       "width": 5100,
#       "height": 3400,
#       "color": "#737373",
#       "blur_hash": "LREf+-kBo}V[cIt7ozR%k?fhkCWC",
#       "description": "Daybreak over downtown Denver with a view of the Rocky Mountains to the west",
#       "alt_description": "aerial view of city buildings during daytime",
#       "urls": {
#         "raw": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5&ixlib=rb-1.2.1",
#         "full": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5&ixlib=rb-1.2.1&q=85",
#         "regular": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5&ixlib=rb-1.2.1&q=80&w=1080",
#         "small": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5&ixlib=rb-1.2.1&q=80&w=400",
#         "thumb": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5&ixlib=rb-1.2.1&q=80&w=200"
#       },
#       "links": {
#         "self": "https://api.unsplash.com/photos/NflJmUuaYVI",
#         "html": "https://unsplash.com/photos/NflJmUuaYVI",
#         "download": "https://unsplash.com/photos/NflJmUuaYVI/download?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5",
#         "download_location": "https://api.unsplash.com/photos/NflJmUuaYVI/download?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM3NjI3Mzc5"
#       },
#       "categories": [],
#       "likes": 23,
#       "liked_by_user": false,
#       "current_user_collections": [],
#       "sponsorship": null,
#       "topic_submissions": {},
#       "user": {
#         "id": "iReUjmhpLcw",
#         "updated_at": "2021-11-21T21:08:07-05:00",
#         "username": "andrewcoop",
#         "name": "Andrew Coop",
#         "first_name": "Andrew",
#         "last_name": "Coop",
#         "twitter_username": null,
#         "portfolio_url": null,
#         "bio": "I'm an amateur who likes to shoot just about everything that looks interesting.  I want to get more experience with portraiture, and will shoot personal photos for anyone for free.  Where possible, attribution is appreciated please and thank you.",
#         "location": "Aurora, CO, USA",
#         "links": {
#           "self": "https://api.unsplash.com/users/andrewcoop",
#           "html": "https://unsplash.com/@andrewcoop",
#           "photos": "https://api.unsplash.com/users/andrewcoop/photos",
#           "likes": "https://api.unsplash.com/users/andrewcoop/likes",
#           "portfolio": "https://api.unsplash.com/users/andrewcoop/portfolio",
#           "following": "https://api.unsplash.com/users/andrewcoop/following",
#           "followers": "https://api.unsplash.com/users/andrewcoop/followers"
#         },
#         "profile_image": {
#           "small": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
#           "medium": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
#           "large": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
#         },
#         "instagram_username": null,
#         "total_collections": 0,
#         "total_likes": 36,
#         "total_photos": 296,
#         "accepted_tos": true,
#         "for_hire": true,
#         "social": {
#           "instagram_username": null,
#           "portfolio_url": null,
#           "twitter_username": null,
#           "paypal_email": null
#         }
#       },
#       "tags": [
#         {
#           "type": "search",
#           "title": "denver"
#         },
#         {
#           "type": "search",
#           "title": "co"
#         },
#         {
#           "type": "search",
#           "title": "usa"
#         }
#       ]
#     }
#   ]
# }
#
