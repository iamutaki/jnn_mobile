class UserFailure {
  const UserFailure(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}
