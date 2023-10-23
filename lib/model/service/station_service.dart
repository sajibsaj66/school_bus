import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/bus_repository.dart';
import 'package:kumoh_school_bus/model/repository/station_repository.dart';

class StationService {
  StationService._privateConstructor();

  static final StationService _instance = StationService._privateConstructor();

  factory StationService() {
    return _instance;
  }

  final StationRepository _repository = StationRepository();

  final List<StationDTO> _stationDTOList = [];

  List<StationDTO> get stationDTOList => _stationDTOList;

  Future requestStationList() async {
    _stationDTOList.clear();
    _stationDTOList.addAll(await _repository.requestStationList());
  }
}
