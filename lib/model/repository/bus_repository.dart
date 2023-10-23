import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/select_response_dto.dart';

import 'base_repository.dart';

class BusRepository implements BaseRepository {
  @override
  String path = "/bus";

  BusRepository._privateConstructor();

  static final BusRepository _instance = BusRepository._privateConstructor();

  factory BusRepository() {
    return _instance;
  }

  Future<SearchResponseDTO> requestSearchBus(
      SearchRequestDTO requestDTO) async {
    Map<String, dynamic>? json =
        await BaseRepository.post("$path/", requestDTO.toJson());
    print(json);
    return SearchResponseDTO.fromJson(json);
  }

  Future<List<SelectResponseDTO>> requestSelectBus() async {
    Map<String, dynamic>? json = await BaseRepository.get("$path/select");
    return (json["data"] as List<dynamic>)
        .map((e) => SelectResponseDTO.fromJson(e))
        .toList();
  }
}
