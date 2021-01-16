class Api::V1::UserPhotoController < ApiController

    def show
      userId = params[:id] 
      type = ''
      user = User.select(:image, :extention).find(userId)

      case user.extention
        when 'png'  then type = 'image/png'
        when 'jpeg' then type = 'image/jpeg'
        else  type = 'image/jpeg'
      end
      send_data user.image, type: type, disposition: 'inline'
    end

end