# tasks.rake
require 'httparty'

namespace :import do
    desc "Import data from open API"
    task API: :environment do
        include HTTParty
        page = 1
        while page < 11
            response = HTTParty.get("http://www.omdbapi.com/?apikey=c9feda2c&s=love&page=#{page}")
            data = JSON.parse(response.body) 
            payload = data["Search"] if response.code == 200
            index = 0
            while index < 10
                currentpayload = {
                    :title => payload[index]["Title"],
                    :year => payload[index]["Year"],
                    :imdbID => payload[index]["imdbID"],
                    :length_type => payload[index]["Type"],
                    :poster => payload[index]["Poster"]
                }
                p currentpayload
                value = {title: currentpayload[:title], year: currentpayload[:year], imdbID: currentpayload[:imdbID], length_type: currentpayload[:length_type], poster: "hjsweuhwiowo"}
                #byebug
                #puts value
                Movie.create!(value)
                index = index + 1
            end
            page = page + 1
        end
    end
end