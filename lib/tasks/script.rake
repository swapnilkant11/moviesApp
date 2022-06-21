# tasks.rake
require 'httparty'

namespace :import do
    desc "Import data from open API"
    task API: :environment do
        # include HTTParty
        # page = 1
        # while page < 11
        #     response = HTTParty.get("http://www.omdbapi.com/?apikey=c9feda2c&s=love&page=#{page}")
        #     data = JSON.parse(response.body) 
        #     payload = data["Search"] if response.code == 200
        #     p data["Search"]
        #     index = 0
        #     while index < 10
        #         currentpayload = {
        #             :title => payload[index]["Title"],
        #             :year => payload[index]["Year"],
        #             :imdbID => payload[index]["imdbID"],
        #             :length_type => payload[index]["Type"],
        #             :poster => payload[index]["Poster"]
        #         }
                value = {title: "Crazy, Stupid, Love.", year: "2011", imdbID: "tt1570728", length_type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMTg2MjkwMTM0NF5BMl5BanBnXkFtZTcwMzc4NDg2NQ@@._V1_SX300.jpg"}
                #puts value
                Movie.create(value)
                #index = index + 1
            #end
            #page = page + 1
        #end
    end
end