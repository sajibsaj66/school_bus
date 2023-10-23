import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/service/bus_time_reservation_service.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

class DriverViewModel extends ChangeNotifier {
  final BusTimeSeatReservationService _busTimeSeatReservationService =
      BusTimeSeatReservationService();
  final ReservationService _reservationService = ReservationService();
  final BusService _busService = BusService();
  late BusTimeReservationDTO busTimeReservation;

  DriverViewModel() {
    busTimeReservation =
        _busTimeSeatReservationService.busTimeSeatReservationDTO;
  }

  void finish(BuildContext context, bool mounted) async {
    try {
      await _reservationService.finish(_busService.busTimeId!);
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, "/driver/select", (route) => false);
      }
    } catch (e) {
      print(e);
      BasicAlterDialog.showWarningDialog(context, "운행 종료에 실패하였습니다");
    }
  }
}
