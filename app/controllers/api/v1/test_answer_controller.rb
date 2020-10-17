class Api::V1::TestAnswerController < ApiController
    before_action :set_tesfForms, only: [:show,:update]
    before_action :text_check # この行を追加！

    include TestFormOptions
  
    # ActiveRecordのレコードが見つからなければ404 not foundを応答する
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: '404 not found' }, status: 404
    end
  
    def index
      testForms = TestForm.all
      render json: testForms
    end
  
    def show
      results = Array.new
      testFormHeader = TestFormHeader.find(params[:id])

      @tesfForms.each do | testForm |
        #解答をnilに変更
        testForm.display_order = nil
        #テスト選択肢を取得
        options = getTestFormOptions(testForm.id)
        
        #画面用配列に設定
        tmp = testForm.attributes
        tmp[:options] = options
        
        #配列に入れる
        results.push(tmp)
      end

      rtnHash = {}
      rtnHash[:testFormHeader] = testFormHeader
      rtnHash[:testForms] = results

      render json: rtnHash
    end
  
    def update
      #画面から取得したパラメータを保存する配列
      results = Array.new

      header_param = params.require(:test_form_header)
      exist = TestResultHeader.where(test_form_header_id: header_param[:id]).count
      testFormHeader = TestFormHeader.find(header_param[:id])

      testResultHeader = {}
      testResultHeader[:try_time] = exist + 1
      testResultHeader = testFormHeader.test_result_header.build(testResultHeader)

      testResults = []
      correctNum = 0
      params.require(:test_forms).each do |test|

        #ひとつずつパラメータを許可
        permitted = testform_params(test)
        #testForm002 = @tesfForms.select { |element| element.id == permitted["id"] }
        testForm = @tesfForms.find(permitted[:id])

        tmp = testForm.attributes
        #正解をセット
        tmp[:answer] = testForm.display_order
        #自分の解答をセット
        tmp[:yourAnswer] = permitted[:answer]

        if (tmp[:yourAnswer] == testForm.display_order)  
          tmp[:result] = CONSTANTS::TESTFORM::CORRECT_ANSWER
          correctNum += 1
        else
          tmp[:result] = CONSTANTS::TESTFORM::WRONG_ANSWER
        end

        #テスト選択肢を取得
        options = getTestFormOptionsHash(testForm.id)
        tmp[:options] = options

        #テスト結果保存用レコード
        testResult = testResultHeader.test_result.build()
        correctOptionId = options.select { |element| element["display_order"] == testForm.display_order }
        yourOptionId = options.select { |element| element["display_order"] == tmp[:yourAnswer] }
        optionDisplayOrders = options.map {|element| element["id"] }.join(',')

        testResult[:answer_option_id] = correctOptionId.first["id"]
        testResult[:your_answer_option_id] = yourOptionId.first["id"]
        testResult[:option_display_orders] = optionDisplayOrders
        byebug
        testResults.push(testResult)
       
        #再び配列に入れる
        results.push(tmp)
      end

      #結果headerテーブルに保存
      testResultHeader[:correct_num] = correctNum

      if testResultHeader.save && testResults.each{|option| option.save}
        @result = "success"
      else
        @result = "fail"
      end


      rtnHash = {}
      rtnHash[:testForms] = results
      render json: rtnHash
    end
    
    private
      def testform_params(params)
        params.permit(:id,:content,:answer)
      end
  end