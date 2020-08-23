class ApiController < ActionController::API

    def text_check
        client = request.headers['client']
        token = request.headers['access-token']
        contentType = request.headers['Content-Type']
        expiry = request.headers['expiry']
        uid = request.headers['uid']

        logger.debug('test')
        logger.debug(client)
        logger.debug(token)
        logger.debug(contentType)
        logger.debug(expiry)
        logger.debug(uid)
        
        #  byebug
        #  result = authenticate_api_user!
        #  logger.debug(result)
        #  if (result)  then
        #      logger.debug('true')
        #  else 
        #      logger.debug('false')
        # end
    end
end