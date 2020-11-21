const headerTestTypes = [
    {"id":'0',"value": 'type0'},
    {"id":'1',"value": 'type1'},
    {"id":'2',"value": 'type2'},
    {"id":'3',"value": 'type3'},
    {"id":'99',"value": 'その他'}
]

const MODE_ANSWER  = "0"
const MODE_CHECK   = "1"
const CORRECT  = "0"
const WRONG   = "1"
const TEST_TEXT_ROWS = "2"


const filterTypes = [
    'header_name',
    'test_type',
    'user_id',
    'created_at',
    'updated_at',
    'id'
]

export default {
    headerTestTypes: headerTestTypes,
    filterTypes: filterTypes,
    MODE_ANSWER: MODE_ANSWER,
    MODE_CHECK: MODE_CHECK,
    CORRECT: CORRECT,
    WRONG: WRONG,
    TEST_TEXT_ROWS: TEST_TEXT_ROWS
}