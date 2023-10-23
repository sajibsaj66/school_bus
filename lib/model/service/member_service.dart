import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/member_repository.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';

class MemberService {
  MemberService._privateConstructor();

  final MemberRepository _repository = MemberRepository();

  MemberInfoDTO? _memberInfoDTO;

  MemberInfoDTO? get memberInfoDTO => _memberInfoDTO;

  static final MemberService _instance = MemberService._privateConstructor();

  factory MemberService() {
    return _instance;
  }

  Future login(LoginDTO loginDTO) async {
    _memberInfoDTO = await _repository.login(loginDTO);
    DrawerAppBarScaffoldController().changeMemberInfo(
      _memberInfoDTO!.name,
      _memberInfoDTO!.id,
    );
  }

  Future signup(MemberInfoDTO signupDTO) async {
    await _repository.signup(signupDTO);
  }

  Future logout() async {
    _repository.logout();
    _memberInfoDTO = null;
  }

  Future editInfo(String password) async {
    if (_memberInfoDTO == null) return;
    await _repository.editInfo(_memberInfoDTO!.id, password);
  }

  Future removeMember() async {
    if (_memberInfoDTO == null) {
      return;
    }
    await _repository.removeMember(_memberInfoDTO!.id);
    _memberInfoDTO = null;
  }
}
