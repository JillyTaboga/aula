import '../core/error_dialog.dart';

class Result<T> {
  Result(this.success, {this.error, this.data, this.erroCode = 99});
  bool success;
  String error;
  int erroCode;
  T data;

  Future<T> showError<T>() async {
    if (!success) {
      return await showErrorDialog<T>(
          type: DialogType.Alert,
          message: this.error + ' (cod: ${this.erroCode.toString()})');
    }
    return null;
  }

  sucessWithWarning(
    OnSuccess<T> ifSuccess,
  ) async {
    if (this.success) {
      await ifSuccess(data);
    } else {
      this.showError();
    }
  }

  fold(OnSuccess<T> ifSuccess, OnError ifError) async {
    if (this.success) {
      await ifSuccess(data);
    } else {
      await ifError(error, erroCode);
    }
  }
}

typedef OnSuccess<T>(T data);
typedef OnError(String error, int cod);
