class Api::V1::UserEditController < ApiController
  def index
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    render json: user
  end

  def update
    userId = 1
    content_type = create_extension(params[:file])
    contents = params[:file].sub %r/data:((image|application)\/.{3,}),/, ''
    decoded_data = Base64.decode64(contents)

    #写真テーブルに登録があるかを確認
    rcCount = UserPhoto.where(user_id: userId).count

    if rcCount == 0 then
      user = User.find(userId)
      userPhoto = user.build_user_photo(image: decoded_data, extension: content_type)
      userPhoto.save
    else
      UserPhoto.update(userId,image: decoded_data, extension: content_type)
    end
    
    User.update(userId, name: params[:name], nickname: params[:nickname]) 

    render json: "ok", status: 200
  end

  private

  def create_extension(image)
    content_type = rex_image(image)
    content_type[%r/\b(?!.*\/).*/]
  end

  def rex_image(image)
    image[%r/(image\/[a-z]{3,4})|(application\/[a-z]{3,4})/]
  end

  

end