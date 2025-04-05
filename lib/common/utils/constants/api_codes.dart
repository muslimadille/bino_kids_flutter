class ApiCodes{
  static const String SERVER_DEV = 'https://binokids.com/BinoKidsAPIV3/';

  static const String LOGIN_API = 'token';
  static const String BANNER_API = 'Banner/BannerData';
  static const String MAIN_CATEGORIES_API = 'Menus/FirstMenu';
  static const String SUB_CATEGORIES_API='Menus/ModelAgeSecondMenu';
  static const String GET_PRODUCTS_WITH_FILTERS='/GetModelByModelType';
  static const String GET_MOST_WATCHED="ModelType/GetMostWatchedModels";
  static const String GET_SUGGESTIONS="ModelType/GetSuggestionsModels";
  static const String GET_NEW_ARRIVALS="ModelType/GetNewArrivalModels";
  static const String GET_MODEL_TYPES="ModelType/GetModelTypesByModuleId";
  static const String GET_MODEL_DETAILS="ModelType/getModelDetails";
  static const String ADD_ITEM_TO_CART="Cart/addItemToCart";
  static const String GET_CART_ITEMS="Cart/getAllCartItems";
  static const String EDITE_CART_ITEM="Cart/Edit";
  static const String DELETE_CART_ITEM="Cart/Delete";
  static const String GET_ALL_GOVERNATES="Cart/AllGovernorate";
  static const String GET_ALL_ADDERESSES="Users/GetAddressesByUserId";
  static const String SET_ORDER="Cart/addUserOrder";
  static const String GET_WISH_LIST="WishList/GetAllWishList";
  static const String CHAGE_FAVOUTITE="WishList/ToggleFavorite";
  static const String DELETE_ALL_WISH_LIST="WishList/DeleteAll";
  static const String EDITE_WISH_LIST_ITEM="WishList/EditWishListItem";


  static const String ADD_ALL_WISH_LIST_TO_CART="Cart/AddAllItemsToCartFromWishList";
  static const String DELETE_WISH_LIST_ITEM="WishList/Delete";
  static const String REGISTER="Users/createNewAccount";
  static const String DELETE_ACCOUNT="Users/DeleteAccount";
  static const String CUSTOMER_SERVICE_NUMBER_API="Users/CustomerServicePhone";


  static const String GET_ABOUT_US="Policies/AboutUs";
  static const String GET_PRIVACY_POLICY="Policies/returnPrivacyPolicy";
  static const String GET_RETURN_AND_EXCHANGE_POLICY="Policies/ReturnAndExchangePolicy";
  static const String GET_RETURN_SHIPPING_POLICY="Policies/ReturnShippingPolicy";

  static const String GET_OREDERS="Requests/GetUserRequests";
  static const String GET_OREDER_DETAILS="Requests/GetRequestDetails";

  static const String GET_SEARCH="Search/MainSearch";
  static const String VERIFY_USER_API="Verification/VerifyCode";
  static const String IS_USER_VERIFIED_API="Verification/IsUserVerified";
  static const String RESEND_VERIFICATION_CODE="Verification/ResendCode";
  static const String GET_BRANCHES="Branches/getAllBranches";
  static const String APPLY_PROMOCODE="Cart/ApplyPromocode";
  static const String CHECK_IS_PROMOCODE_ENABLE="Cart/PromocodesExist";


  static const String RESET_PASSWORD="Users/SendNewPassword";
  static const String CHANGE_PASSWORD="Users/ChangePassword";
  static const String GET_USER_DATA="Users/GetUserData";
  static const String UPDATE_PROFILE="Users/UpdateProfile";
  static const String MESSAGES="UserMessages/returnAllUserMessage";
  static const String CHECK_THIRD_PARRTY="Users/RegisterWithThirdPartyCheck";
  static const String SOCIAL_REGISTER="Users/RegisterWithThirdParty";
  static const String MOBILE_VERSIONS="MobileVersion/GetLatestMobileVersion";
















}