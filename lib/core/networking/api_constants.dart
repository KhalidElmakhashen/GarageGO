class ApiConstants {
  // static const String apiBaseUrl = "https://e8b3-197-63-172-54.ngrok-free.app/api/";
  // static const String apiBaseUrl = "https://ispot.runasp.net/api/";
  // static const String apiBaseUrl = "http://192.168.43.13:5158/api/";  // local with internet
  // static const String apiBaseUrl = "http://192.168.0.109:5158/api/";  // local with internet
  static const String apiBaseUrl = "http://192.168.1.6:5158/api/";  // local with internet



  static const String login = "Auth/login";
  static const String signup = "Auth/Register";
  static const String verifyEmail = "Auth/VerifyEmail";
  static const String getAllGarages = "Garages/GetAllGarages";
  static const String getGarageById = "Garages/GetGarageById/{id}";
  static const String addReservationRecord = "ReservationRecords/Add";
  static const String deleteReservationRecord = "ReservationRecords/Delete/{id}";
  static const String getUserById = "Users/getUserById/{id}";
  static const String addNewCar = "Cars/AddNewCar";
  static const String getCarByUserId = "Cars/GetCarsByUserId/{userId}";

  
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
