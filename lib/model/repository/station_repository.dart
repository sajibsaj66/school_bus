import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';

class StationRepository implements BaseRepository {
  @override
  String path = "/station";

  StationRepository._privateConstructor();

  static final StationRepository _instance =
      StationRepository._privateConstructor();

  factory StationRepository() {
    return _instance;
  }

  Future<List<StationDTO>> requestStationList() async {
    Map<String, dynamic>? response = await BaseRepository.get("$path/");
    return (response['data'] as List<dynamic>)
        .map((e) => StationDTO.fromJson(e))
        .toList();
  }
}
