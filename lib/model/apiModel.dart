import 'auth_api_model.dart';

class APIModel<T> {
  final T response;
  final Message? message;

  APIModel({
    required this.response,
    this.message,
  });

  APIModel<T> copyWith({
    T? response,
    Message? message,
  }) {
    return APIModel<T>(
      response: response ?? this.response,
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'APIModel(response: $response, message: $message)';

  @override
  bool operator ==(covariant APIModel<T> other) {
    if (identical(this, other)) return true;

    return other.response == response && other.message == message;
  }

  @override
  int get hashCode => response.hashCode ^ message.hashCode;

  // Named constructor for creating an instance from a map
  // factory APIModel.fromMap(
  //     Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMapT) {
  //   return APIModel<T>(
  //     response: fromMapT(map['response']),
  //     message: Message.fromMap(map['message'] as Map<String, dynamic>),
  //   );
  // }
  factory APIModel.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMapT) {
    return APIModel<T>(
      response: fromMapT(map['response'] as Map<String, dynamic>),
      message: map['message'] != null
          ? Message.fromMap(map['message'] as Map<String, dynamic>)
          : null,
    );
  }
}

// Example usage with MyResponseType
class MyResponseType {
  // Assuming MyResponseType has a fromMap method
  MyResponseType.fromMap(Map<String, dynamic> map) {
    // Implementation to convert the map to MyResponseType
  }
}
