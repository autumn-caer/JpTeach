class Api::V1::UserPhotoController < ApiController

    def show
      userId = params[:id] 
      type = ''
    
      photoArray = UserPhoto.where(user_id: userId).select(:image, :extension).limit(1)
      if photoArray.empty? then
        return send_data nil, type: type, disposition: 'inline'
      end

      case photoArray[0].extension
        when 'png'  then type = 'image/png'
        when 'jpeg' then type = 'image/jpeg'
        else  type = 'image/jpeg'
      end
      send_data photoArray[0].image, type: type, disposition: 'inline'
    end

end