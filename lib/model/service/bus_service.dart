import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/select_response_dto.dart';
import 'package:kumoh_school_bus/model/repository/bus_repository.dart';

class BusService {
  BusService._privateConstructor();

  static final BusService _instance = BusService._privateConstructor();

  factory BusService() {
    return _instance;
  }

  final BusRepository _repository = BusRepository();

  SearchResponseDTO? _searchResponseDTO;

  SearchResponseDTO? get searchResponseDTO => _searchResponseDTO;

  List<SelectResponseDTO>? _selectResponseList;

  List<SelectResponseDTO>? get selectResponseList => _selectResponseList;

  String? busTimeId;

  Future requestSearchBus(SearchRequestDTO requestDTO) async {
    _searchResponseDTO = await _repository.requestSearchBus(requestDTO);
  }

  void clearSearchResponseDTO() {
    _searchResponseDTO = null;
  }

  Future requestSelectBus() async {
    _selectResponseList = await _repository.requestSelectBus();
  }
}
