import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/util/date_format.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  final StationService _stationService = StationService();
  final BusService _busService = BusService();

  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();
  StationDTO? station;
  List<StationDTO> stations = [];
  Set<Marker> setOfMarkers = {};

  MainViewModel() {
    _stationService.requestStationList().then((value) {
      stations = _stationService.stationDTOList;
      setOfMarkers = stations
          .map((e) => e.toMarker(() {
                station = e;
                notifyListeners();
              }))
          .toSet();
      notifyListeners();
    });
  }

  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }

  void onReservationDateChanged(DateTime? value) {
    reservationDate = value ?? reservationDate;
    notifyListeners();
  }

  void navigateToReservationPage(BuildContext context, bool mounted) async {
    print('''
          date: ${onlyDateFormat.format(reservationDate)},
          type: ${direction.toString()},
          station: ${station!.sName},
    ''');
    try {
      await _busService.requestSearchBus(
        SearchRequestDTO(
          date: onlyDateFormat.format(reservationDate),
          type: direction.toString(),
          station: station!.sName,
        ),
      );
      if (_busService.searchResponseDTO!.busList.isEmpty) {
        throw Exception("BusList is Empty");
      }
      if (mounted) {
        Navigator.pushNamed(context, "/reservation");
      }
    } catch (e) {
      BasicAlterDialog.showWarningDialog(context, "해당하는 버스가 없습니다.");
    }
  }
}
