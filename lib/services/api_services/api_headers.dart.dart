// class ApiHeaders {
//   static Map<String, String> basicHeaders() {
//     return {'Content-Type': 'application/json', 'Accept': 'application/json'};
//   }

//   static Map<String, String> authHeaders() {
//     final token = UserStorage.getToken();
//     return {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//   }

//   static Map<String, String> customHeaders({
//     Map<String, String>? extraHeaders,
//     bool includeAuth = false,
//   }) {
//     final headers = basicHeaders();

//     if (includeAuth) {
//       final token = UserStorage.getToken();
//       headers['Authorization'] = 'Bearer $token';
//     }

//     if (extraHeaders != null) {
//       headers.addAll(extraHeaders);
//     }

//     return headers;
//   }
// }
