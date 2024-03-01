class MarkStatusModel {
  bool? bad;
  bool? middle;
  bool? success;

  MarkStatusModel(
      {this.bad = false, this.middle = false, this.success = false});

  String getState() {
    if (bad!) {
      return "bad";
    } else if (success!) {
      return "success";
    }
    return "middle";
  }
}
