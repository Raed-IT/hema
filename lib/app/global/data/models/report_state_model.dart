import 'package:school/app/global/data/enums/report_status_enum.dart';

import 'main_model.dart';

class ReportStateModel extends Model {
  String? name;

  ReportStateModel(this.name);

  @override
  int getId() {
    // TODO: implement getId
    throw UnimplementedError();
  }

  @override
  String getName() {
    return name!.toReportItemName();
  }
}
