import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/time_seat_reservation_dto.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view_model/driver_view_model.dart';
import 'package:provider/provider.dart';

class DriverView extends StatelessWidget {
  const DriverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DriverViewModel>(
      create: (_) => DriverViewModel(),
      child: Consumer<DriverViewModel>(
        builder: (context, provider, child) => _DriverPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _DriverPage extends StatefulWidget {
  final DriverViewModel viewModel;

  const _DriverPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<_DriverPage> {
  late final DriverViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: "Kumoh School Bus",
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount:
                  _viewModel.busTimeReservation.timeSeatReservationList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  LeftSideOutlinedButton(
                    onPressed: () => _viewModel.busTimeReservation
                                .timeSeatReservationList[index].memberDTO ==
                            null
                        ? null
                        : _showReservationInfoDialog(
                            context,
                            _viewModel.busTimeReservation
                                .timeSeatReservationList[index],
                          ),
                    text: _viewModel.busTimeReservation
                        .timeSeatReservationList[index].timeSeatDTO.seatNum
                        .toString(),
                    iconData: _viewModel
                            .busTimeReservation
                            .timeSeatReservationList[index]
                            .timeSeatDTO
                            .isReserved
                        ? Icons.circle_outlined
                        : Icons.close,
                  ),
                  const SizedBox(height: SizeTheme.paddingMiddleSize)
                ],
              ),
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            CentralOutlinedButton(
              onPressed: () => _viewModel.finish(context, mounted),
              text: '운행 종료',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showReservationInfoDialog(BuildContext context,
      TimeSeatReservationDTO timeSeatReservationDTO) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '예약 정보',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "이름 : ${timeSeatReservationDTO.memberDTO!.name}",
                  style: TextStyleTheme.textMainStyleMiddle,
                ),
                const SizedBox(height: SizeTheme.paddingMiddleSize),
                Text(
                  "학번 : ${timeSeatReservationDTO.memberDTO!.id}",
                  style: TextStyleTheme.textMainStyleMiddle,
                ),
                const SizedBox(height: SizeTheme.paddingMiddleSize),
                Text(
                  "학과 : ${timeSeatReservationDTO.memberDTO!.major.toString()}",
                  style: TextStyleTheme.textMainStyleMiddle,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '닫기',
                style: TextStyleTheme.textMainStyleMiddle,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
