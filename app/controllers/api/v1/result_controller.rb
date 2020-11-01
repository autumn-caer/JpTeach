class Api::V1::ResultController < ApiController
    before_action :set_tesfForms, only: [:show,:update]
    before_action :text_check # この行を追加！

    include TestFormOptions
  
    # ActiveRecordのレコードが見つからなければ404 not foundを応答する
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: '404 not found' }, status: 404
    end
  
    def show
      results = Array.new
      #テスト結果のheaderを取得
      testResultHeader = TestResultHeader.find(params[:id])
      #テスト結果の詳細を取得
      testResults = TestResult.where(test_result_header_id: testResultHeader.id)

      #正解数
      correctNum = 0
      
      #テスト当時の並び順を取得する。
      optionOrders = Array.new
      testResults.each do | testResult | 
        optionOrders.push(testResult.option_display_orders.split(','))
      end
      
      #問題を取得
      testForms =  TestForm.where(test_form_header_id: testResultHeader[:test_form_header_id])
      #問題ごとにループ開始
      testForms.each_with_index do | testForm,i |
        #テスト選択肢を取得
        options = getTestFormOptions(testForm.id)

        orderdOptions = Array.new
        #テスト当時の並び順に修正する
        optionOrders[i].each_with_index do | order, j|
          option = options.select { |element| element.id == order.to_i }
          if option.present?
            optionFirst = option.first
            optionFirst[:display_order] = j
            orderdOptions.push(optionFirst) 
          end
        end
        
        #画面用配列に設定
        tmp = testForm.attributes

        #選択肢情報を設定
        tmp[:options] = orderdOptions

        #正解レコードの表示番号を設定
        correctOptionId = options.select { |element| element[:id] == testResults[i].answer_option_id }
        tmp[:answer] = correctOptionId.first[:display_order]

        #選択解答レコードの表示番号を設定
        yourOptionId = options.select { |element| element[:id] == testResults[i].your_answer_option_id }
        tmp[:yourAnswer] = yourOptionId.first[:display_order]

        #結果を設定する
        if (yourOptionId.first[:id] == correctOptionId.first[:id])  
          tmp[:result] = CONSTANTS::TESTFORM::CORRECT_ANSWER
          correctNum += 1
        else
          tmp[:result] = CONSTANTS::TESTFORM::WRONG_ANSWER
        end
        
        #配列に入れる
        results.push(tmp)
      end

      #テストFormHeaderを取得
      testFormHeader = TestFormHeader.find(testResultHeader[:test_form_header_id])

      rtnHash = {}
      rtnHash[:testFormHeader] = testFormHeader
      # rtnHash[:testResultHeader] = testResultHeader
      # rtnHash[:testResult] = testResults
      rtnHash[:testForms] = results

      render json: rtnHash
    end
      
  end