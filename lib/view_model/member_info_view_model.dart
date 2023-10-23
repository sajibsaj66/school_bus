import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/reservation_chart_dto.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

import '../model/service/services.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final MemberService _memberService = MemberService();

  MemberInfoDTO? get memberInfoDTO => _memberService.memberInfoDTO;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  List<ReservationChartDTO> reservationCharDTOList = [];

  final ReservationService _reservationService = ReservationService();

  MemberInfoViewModel() {
    _reservationService.requestReservationChart().then((value) {
      reservationCharDTOList = value;
      notifyListeners();
    });
  }

  Future onEditButtonClick(BuildContext context, bool mounted) async {
    if (passwordController.text.isEmpty &&
        checkPasswordController.text.isEmpty) {
      await BasicAlterDialog.showWarningDialog(context, "모든 데이터를 입력해주세요");
      return;
    }
    if (passwordController.text != checkPasswordController.text) {
      await BasicAlterDialog.showWarningDialog(context, "비밀번호 확인을 해주세요");
      return;
    }
    try {
      await _memberService.editInfo(passwordController.text);
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }    } catch (e) {
      print(e);
      BasicAlterDialog.showWarningDialog(context, "회원 정보 수정에 실패했습니다.");
    }
  }

  Future onRemoveButtonClick(BuildContext context, bool mounted) async {
    try {
      await _memberService.removeMember();
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
    } catch (e) {
      BasicAlterDialog.showWarningDialog(context, "회원 삭제에 실패하였습니다.");
    }
  }
}
