module TestFormOptions extend ActiveSupport::Concern
    included do
        def headerTestForm_param
            params.require(:test_form_header).permit(:header_name,:question_num,:user_id,:test_type,:test_form_version_operation_id,:version, :open_type)
        end

        def set_tesfForms
            @tesfForms = TestForm.joins(:test_form_options)
                                .where(test_form_header_id: params[:id])
                                .where(test_form_options: {correct: CONSTANTS::TESTFORM::CORRECT_ANSWER})
                                .select("test_forms.id, 
                                        test_forms.content,
                                        test_form_options.display_order")
        end

        def getTestFormOptions(id)
            TestFormOption.where(test_form_id: id).select(:id,:label,:display_order,:updated_at).order(:display_order)
        end

        def getTestFormOptionsHash(id)
            TestFormOption.where(test_form_id: id)
                           .select(:id,:label,:display_order,:updated_at)
                           .order(:display_order)
                           .map{|option| option.attributes}
        end
    end  
end