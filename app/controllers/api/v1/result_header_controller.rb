class Api::V1::ResultHeaderController < ApiController
  before_action :set_tesfForms, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    testFormHeaders = TestResultHeader.joins(:test_form_header) \
                                    .where(user_id: '1') \
                                    .select("test_form_headers.header_name,
                                             test_form_headers.test_type,
                                             test_form_headers.question_num,
                                             test_form_headers.version,
                                             test_result_headers.test_form_header_id,
                                             test_form_headers.test_form_version_operation_id,
                                             count(test_result_headers.id) as count_all")
                                    .group(:test_form_header_id \
                                           ,:test_form_version_operation_id)

    resultHeaderList = []
    testFormHeaders.each_with_index do | testFormHeader,i |
      resultHeaders = TestResultHeader.where(test_form_header_id: testFormHeader.test_form_header_id)
      resultHeaderList.push(resultHeaders)
    end
    
    rtnHash = {}
    rtnHash[:testFormHeaders] = testFormHeaders
    rtnHash[:resultHeaderList] = resultHeaderList

    render json: rtnHash
  end

  def show
    render json: @tesfFormHeader  
  end

  private
    def set_tesfFormHeaders
        @tesfFormHeader= TestFormHeader.find(params[:id])
    end
end