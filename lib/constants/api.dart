class API {
  static const BASE_URL = 'https://app.childcaresoftware.com/api/';
  static String TOKEN = '';
  static String API_VERSION = '';
  static String MWS_DB_SERVER = '';
  static String CURRENT_ACCOUNT_ID = '';
  static String CURRENT_USER_ID = '';
  static const IMG_URL = 'https://m.media-amazon.com/images/I/';
  static const BASE_IMG_URL = 'https://app.childcaresoftware.com/';
}

class UserAPI {
  static const LOGIN_URL = 'mobile-login';
  static const REGISTER_URL = 'mobile/registration/create_user_account';
  static const ACTIVATE_URL = 'active';
  static const FORGOT_PASSWORD_URL = 'mobile/forgot_password/get_reset_link';
  static const FORGOT_PASSWORD_CODE_URL = 'pw/forgot/code';
  static const RESET_PASSWORD_CODE_URL = 'pw/reset';
  static const PROFILE_URL = 'mobile/user-profile';
  static const UPLOAD_IMAGE_URL = 'avatar-update';
  static const SAVE_PROFILE_URL = 'seeker/profile';
  static const CHANGE_PASSWORD_CODE_URL = 'pw/update';
  static const LOGOUT_URL = 'logout';
  static const DELETE_EXPERIENCE_URL = 'seeker/exps';
  static const CREATE_EXPERIENCE_URL = 'seeker/exps';
  static const UPDATE_EXPERIENCE_URL = 'seeker/exps';
  static const UPLOAD_RESUME_URL = 'seeker/profile/resume';
  static const ADD_EDUCATION_URL = 'seeker/profile/edu';
  static const UPDATE_EDUCATION_URL = 'seeker/profile/edu';
  static const DELETE_EDUCATION_URL = 'seeker/profile/edu';
  static const UPLOAD_CERTIFICATE_URL = 'seeker/profile/cert';
  static const DELETE_CERTIFICATE_URL = 'seeker/profile/cert';
  static const DELETE_AFFILIATION_URL = 'seeker/branches';
  static const ADD_AFFILIATION_URL = 'seeker/branches';
}

class JobAPI {
  static const SEARCH_JOB_URL = 'seeker/jobs/search';
  static const JOB_DETAIL_URL = 'seeker/jobs/detail';
  static const UPDATE_FAVORITE_JOB_URL = 'seeker/jobs/favorites/update';
  static const UPDATE_STATUS_JOB_URL = 'seeker/jobs/status';
  static const FAVORITE_URL = 'seeker/jobs/favorites';
  static const APPLIED_URL = 'seeker/jobs/applied';
}

class NotificationAPI {
  static const NOTIFICATION_LIST_URL = 'seeker/notify';
  static const NOTIFICATION_MARK_AS_READ = 'seeker/notify/update-status';
}

class ScheduleAPI {
  static const SCHEDUEL_LIST_URL = 'seeker/schedule';
}

class SettingsAPI {
  static const SETTINGS_URL = 'seeker/settings';
  static const MUTE_NOTIFICATION_URL = 'seeker/settings/notify/mute';
  static const MUTE_NOTIFICATION_BY_DATE_URL =
      'seeker/settings/notify/mute-by-date';
  static const START_SCREEN = 'start_screen';
}

class ProductResearchAPI {
  static const GET_TRENDS_LIST = 'mobile/product_research/trends';
  static const GET_CHART_LIST = 'mobile/product_research/price_trend/';
  static const GET_PRODUCT_LIST = 'mobile/my_list/asin';
  static const ADD_PRODUCT_TO_MY_LIST = 'mobile/my_list/asin/add';
  static const REMOVE_PRODUCT_FROM_MY_LIST = 'mobile/my_list/asin/delete';
  static const GET_PRODUCT_SIZE = 'mobile/get_product_sizes';
  static const GET_RESEARCH_PRODUCT_LIST = 'mobile/product_research/research';
  static const GET_DAILY_REVENUE_CHART =
      'mobile/product_research/product/revenue/';
  static const GET_SALES_RANK_CHART =
      'mobile/product_research/product/salesrank/';
  static const GET_RATING_CHART = 'mobile/product_research/product/review/';
  static const GET_SELLERS_CHART = 'mobile/product_research/product/sellers/';
  static const GET_BADGE_HISTORY_CHART =
      'mobile/product_research/product/badge_history/';
}

class BrandResearchAPI {
  static const GET_BRAND_MY_LIST = 'mobile/my_list/brand';
  static const GET_BRANDS_LIST = 'mobile/brand_research/reverse_asin';
  static const GET_RESEARCH_BRAND_LIST = 'mobile/brand_research/research';
  static const ADD_BRAND_TO_MY_LIST = 'mobile/my_list/brand/add';
  static const REMOVE_BRAND_FROM_MY_LIST = 'mobile/my_list/brand/delete';
  static const GET_CATEGORIES_LIST = 'mobile/product_research/get_categories';
  static const GET_COUNTRIES_LIST = 'mobile/country/get';
  static const GET_SUGGESTIONS_BRAND = 'mobile/brand_research/auto_complete';
}

class SellerResearchAPI {
  static const GET_SELLER_MY_LIST = 'mobile/my_list/seller';
  static const GET_LOOKUP_SELLER_LIST = 'mobile/seller_research/reverse_asin';
  static const ADD_BRAND_TO_MY_LIST = 'mobile/my_list/seller/add';
  static const REMOVE_BRAND_FROM_MY_LIST = 'mobile/my_list/seller/delete';
  static const GET_RESEARCH_SELLER_LIST = 'mobile/seller_research/research';
  static const GET_SUGGESTIONS_SELLER = 'mobile/seller_research/auto_complete';
}

class KeywordResearchAPI {
  static const GET_KEYWORD_MY_LIST = 'mobile/my_list/keyword/folders';
  static const REMOVE_KEYWORD_FROM_MY_LIST = 'mobile/my_list/keyword/delete';
  static const ADD_FOLDER_NOTE = 'mobile/my_list/keyword/folders/save_note';
  static const ADD_FOLDER = 'mobile/my_list/keyword/save_folder';
  static const ADD_KEYWORD = 'mobile/my_list/keyword/add_raw_batch';
  static const UPDATE_FOLDER = 'mobile/my_list/keyword/save_folder';
  static const GET_KEYWORD_ITEM_LIST = 'mobile/my_list/keyword/';
  static const REMOVE_KEYWORD_ITEM = 'mobile/my_list/keyword/delete_batch';
  static const MOVE_KEYWORD_ITEM = 'mobile/my_list/keyword/move_batch';
  static const GET_CATEGORIES_LIST = 'mobile/product_research/get_categories';
  static const GET_KEYWORD_RESEARCH_LIST = 'mobile/keyword/research';
  static const GET_KEYWORD_HISTORY_LIST = 'mobile/keyword/processor/history';
  static const REMOVE_HISTORY_KEYWORD_ITEM = 'mobile/keyword/processor/delete';
  static const SAVE_KEYWORD = 'mobile/keyword/processor/save';
  static const GET_ASIN_DETAILS = 'mobile/keyword/asin_reverse_lookup';
  static const SEARCH_KEYWORD = 'mobile/asin_reverse_lookup/search_keywords';
  static const GET_KEYWORD_RESERVE_ASIN_HISTORY_LIST =
      'mobile/asin_reverse_lookup/history';
  static const REMOVE_KEYWORD_RESERVE_ASIN_HISTORY_ITEM =
      'mobile/asin_reverse_lookup/history/delete';
  static const GET_COMPETITOR_LIST =
      'mobile/asin_reverse_lookup/get_competitors';
}

class ListingOptimizeAPI {
  static const GET_MISSPELLING_HISTORY = 'mobile/keyword/processor/history';
  static const REMOVE_MISSPELLING_HISTORY_ITEM =
      'mobile/optimization/misspelling_checker_history/delete';
  static const FIND_MISSPELLING = 'mobile/optimization/misspelling_checker';
}
