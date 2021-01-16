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
const LIST_PAGE_SIZE = 5

const HEADER_NAME = {"kbn": "0", "name" : "header_name"}
const TEST_TYPE   = {"kbn": "1", "name" : "test_type"}
const USER_ID     = {"kbn": "2", "name" : "user_id"}
const CREATED_AT  = {"kbn": "3", "name" : "created_at"}
const ID          = {"kbn": "4", "name" : "id"}
const SAME_DAY    = {"kbn": "0", "name" : "日付指定"}
const BEFORE_DAY  = {"kbn": "1", "name" : "日付以前"}
const AFTER_DAY   = {"kbn": "2", "name" : "日付以後"}
const PUBLIC      = {"id": "0", "value" : "公表"}
const FOLLOWER_ONLY      = {"id": "1", "value" : "フォロワーのみ"}
const PRIVATE      = {"id": "2", "value" : "自身のみ"}

const openTypes = [
    PUBLIC,
    FOLLOWER_ONLY,
    PRIVATE
]
const filterTypes = [
    HEADER_NAME.name,
    TEST_TYPE.name,
    USER_ID.name,
    CREATED_AT.name,
    ID.name
],

dateCondtionList = [
    SAME_DAY.name,
    BEFORE_DAY.name,
    AFTER_DAY.name
]


export default {
    headerTestTypes: headerTestTypes,
    filterTypes: filterTypes,
    openTypes: openTypes,
    dateCondtionList: dateCondtionList,
    MODE_ANSWER: MODE_ANSWER,
    MODE_CHECK: MODE_CHECK,
    CORRECT: CORRECT,
    WRONG: WRONG,
    TEST_TEXT_ROWS: TEST_TEXT_ROWS,
    HEADER_NAME: HEADER_NAME,
    TEST_TYPE: TEST_TYPE,
    USER_ID: USER_ID,
    CREATED_AT: CREATED_AT,
    ID: ID,
    SAME_DAY: SAME_DAY,
    BEFORE_DAY: BEFORE_DAY,
    AFTER_DAY: AFTER_DAY,
    LIST_PAGE_SIZE: LIST_PAGE_SIZE
}