class ResellerFailure {
  const ResellerFailure(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}
