class ApiUrl {
  static const String mainUrl = "http://api.brightlifeapp.com/public";

  //registration
  static const String signIn = "/api/v1/login";
  static const String signUp = "/api/v1/user-reg";
  static const String signOut = "/api/v1/logout";
  static const String verification = "/api/v1/otb-check";
  static const String passwordOTP = "/api/v1/password-otb";
  static const String forgotPass = "/api/v1/password-otb";

  //add product
  static const String addProduct = "/api/v1/products-create";

  //add category to product
  static const String addCategoryToProduct = "/api/v1/products/category";

  //categories
  static const String categories = "/api/v1/categories";

  //view order
  static const String viewOrder = "/api/v1/view-order/";

  //search
  static const String search = "/api/v1/users/search";

  //image
  static const String uploadImage = "/api/v1/products/";

  //change password
  static const String changePassword = "/api/v1/change-password";
}
