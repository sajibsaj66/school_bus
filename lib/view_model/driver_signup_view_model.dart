import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

class DriverSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;
  late final TextEditingController nameController;

  final MemberService _memberService = MemberService();

  DriverSignupViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    checkPasswordController = TextEditingController(text: '');
    nameController = TextEditingController(text: '');
  }

  void signup(BuildContext context, bool mounted) async {
    if (idController.text.isEmpty ||
        passwordController.text.isEmpty ||
        checkPasswordController.text.isEmpty ||
        nameController.text.isEmpty) {
      await BasicAlterDialog.showWarningDialog(context, "모든 데이터를 입력해주세요");
      return;
    }
    if (passwordController.text != checkPasswordController.text) {
      await BasicAlterDialog.showWarningDialog(context, "모든 데이터를 입력해주세요");
      return;
    }
    try {
      await _memberService.signup(MemberInfoDTO(
        id: idController.text,
        password: passwordController.text,
        type: MemberType.driver,
        name: nameController.text,
        major: Major.driver,
      ));
      if (mounted) Navigator.pop(context);
    } catch (e) {
      BasicAlterDialog.showWarningDialog(context, "이미 존재하는 회원입니다.");
    }
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }
}
