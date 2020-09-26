class Api::V1::TestAnswerController < ApiController
    before_action :set_tesfForms, only: [:show,:update]
    before_action :text_check # この行を追加！
  
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
      rtnHash[:testForms] = results

      render json: rtnHash
    end
  
    def update
      #画面から取得したパラメータを保存する配列
      results = Array.new

      params.require(:test_forms).each do |test|

        #ひとつずつパラメータを許可
        permitted = testform_params(test)
        #testForm002 = @tesfForms.select { |element| element.id == permitted["id"] }
        testForm = @tesfForms.find(permitted[:id])

        tmp = testForm.attributes
        tmp[:answer] = testForm.display_order
        tmp[:yourAnswer] = permitted[:answer]

        if (permitted[:answer] == testForm.display_order)  
          tmp[:result] = CORRECT_ANSWER
        else
          tmp[:result] = WRONG_ANSWER
        end

        #テスト選択肢を取得
        options = getTestFormOptions(testForm.id)
        tmp[:options] = options
       
        #再び配列に入れる
        results.push(tmp)
      end

      rtnHash = {}
      rtnHash[:testForms] = results
      render json: rtnHash
    end
    
    private
      def set_tesfForms
        @tesfForms = TestForm.joins(:test_form_options)
                            .where(test_form_header_id: params[:id])
                            .where(test_form_options: {correct: CORRECT_ANSWER})
                            .select("test_forms.id, 
                                    test_forms.content,
                                    test_form_options.display_order")
      end
  
      def headerTestForm_param
        params.require(:test_form_header).permit(:header_name,:question_num,:user_id,:test_type)
      end
  
      def testform_params(params)
        params.permit(:id,:content,:answer,:option_one,:option_two,:option_three,:option_four)
      end

      def getTestFormOptions(id)
        TestFormOption.where(test_form_id: id).select(:label, :display_order).order(:display_order)
      end
  
  end