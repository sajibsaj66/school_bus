import 'package:kumoh_school_bus/model/dto/request_dto.dart';

class SearchRequestDTO implements RequestDTO {
  String date;
  String type;
  String station;

  SearchRequestDTO({
    required this.date,
    required this.type,
    required this.station,
  });

  @override
  SearchRequestDTO.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        type = json['type'],
        station = json['station'];

  @override
  Map<String, dynamic> toJson() => {
        'date': date,
        'type': type,
        'station': station,
      };
}
