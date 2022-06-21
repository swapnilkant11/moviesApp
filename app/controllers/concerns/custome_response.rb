module CustomeResponse
    def success_response(object, status = 200, message = "success")
        response_payload = object.as_json
        render json: { data: response_payload, status: { code: status, message: message } }, status: status
    end

    def remove_movie_response(status = 200, message = "deleted")
        render json: { status: { code: status, message: message } }, status: status
    end
end