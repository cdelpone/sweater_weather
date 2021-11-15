class MapQuestService
  def self.conn
    Faraday.new(url: 'https://www.mapquestapi.com/geocoding/v1/') do |faraday|

      faraday.params['key'] = ENV['MAPQUEST_KEY']
    end
  end

  def self.get_data(url)
    response = conn.get(url)
    data     = response.body

    JSON.parse(data, symbolize_names: true)
  end
end
