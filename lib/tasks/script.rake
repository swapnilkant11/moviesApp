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
            p data["Search"]
            index = 0
            while index < 10
                currentpayload = {
                    :title => payload[index]["Title"],
                    :year => payload[index]["Year"],
                    :imdbID => payload[index]["imdbID"],
                    :length_type => payload[index]["Type"],
                    :poster => payload[index]["Poster"]
                }
                puts currentpayload[:length_type]
                #value = {title: currentpayload[:title], year: currentpayload[:year], imdbID: currentpayload[:imdbID], length_type: currentpayload[:length_type], poster: currentpayload[:poster]}
                #puts value
                #Movie.create(value)
                puts "hello"
                index = index + 1
            end
            page = page + 1
        end
    end
end