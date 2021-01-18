class ApiController < ActionController::API
    # include DeviseTokenAuth::Concerns::SetUserByToken
    # skip_before_action :verify_authenticity_token, if: :devise_controller?

    def text_check
        client = request.headers['client']
        token = request.headers['access-token']
        contentType = request.headers['Content-Type']
        expiry = request.headers['expiry']
        uid = request.headers['uid']

        # logger.debug('test')
        # logger.debug(client)
        # logger.debug(token)
        # logger.debug(contentType)
        # logger.debug(expiry)
        # logger.debug(uid)
        
        #  byebug
        #  authenticate_api_user!
        #      logger.debug('true')
         
    end
end