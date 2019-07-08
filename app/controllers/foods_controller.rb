class FoodsController < ApplicationController
  def index
    food = params[:q]
    @conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["FOOD_KEY"] = "mHcgZdb9IRFCjnYSQ4DkMbzvWzKjTBpWIt71HZCD"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("ndb/search/?format=json&q=#{food}&sort=n&max=25&offset=0&api_key=mHcgZdb9IRFCjnYSQ4DkMbzvWzKjTBpWIt71HZCD")
    results = JSON.parse(response.body, symbolize_names: true)

    @foods = results.map do |result|
      Food.new(result)
    end
  end


end
