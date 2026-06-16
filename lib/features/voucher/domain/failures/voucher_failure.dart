class VoucherFailure {
  const VoucherFailure(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}
