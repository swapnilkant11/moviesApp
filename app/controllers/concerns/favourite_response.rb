module FavouriteResponse
    def favourite_response(object, status = 200, message = "movie added to favourites")
        response_payload = object.as_json
        render json: { data: response_payload, status: { code: status, message: message } }, status: status
    end

    def remove_favourite_response(status = 200, message = "movie removed from favourites")
        render json: {status: {code: status, message: message}}, status: status
    end
end