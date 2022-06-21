module CustomeResponse
    def success_response(object, status = 200, message = "success")
        response_payload = object.as_json
        render json: { data: response_payload, status: { code: status, message: message } }, status: status
    end
end