class Api::V1::UserEditController < ApiController
  def index
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    render json: user
  end

  def update
    content_type = create_extension(params[:file])
    contents = params[:file].sub %r/data:((image|application)\/.{3,}),/, ''
    decoded_data = Base64.decode64(contents)
    User.update(1, image: decoded_data, name: params[:name], nickname: params[:nickname], extention: content_type) 

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