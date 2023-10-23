import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/member_service.dart';
import 'package:kumoh_school_bus/model/service/reservation_service.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

class CheckReservationViewModel extends ChangeNotifier {
  final ReservationService _reservationService = ReservationService();
  final MemberService _memberService = MemberService();
  late List<ReservationDTO> reservationList = [];

  CheckReservationViewModel() {
    _reservationService.requestReservationListByMember(_memberService.memberInfoDTO!.id).then((value) {
      reservationList = _reservationService.reservationDTOList;
      notifyListeners();
    });
  }

  Future onCancelButtonClick(BuildContext context, String reservationId) async {
    try {
      await _reservationService
          .requestDeleteReservation(reservationId, _memberService.memberInfoDTO!.id);
      notifyListeners();
    } catch (e) {
      BasicAlterDialog.showWarningDialog(context, "예약 취소에 실패하였습니다.");
    }
  }
}
