//We are making it static becuase it will take memory only one time and no object will be required for this
class MyRoutes {
  //Remove keyword static to see ,non  static class members cant be access directly
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String homeDetailsRoute = "/detail";
}
