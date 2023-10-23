import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view_model/check_reservation_view_model.dart';
import 'package:provider/provider.dart';

import '../theme/themes.dart';
import 'common/drawer_app_bar_scaffold.dart';

class CheckReservationView extends StatelessWidget {
  const CheckReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckReservationViewModel>(
      create: (_) => CheckReservationViewModel(),
      child: Consumer<CheckReservationViewModel>(
        builder: (context, provider, child) => _CheckReservationPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _CheckReservationPage extends StatefulWidget {
  final CheckReservationViewModel viewModel;

  const _CheckReservationPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  State<_CheckReservationPage> createState() => _CheckReservationPageState();
}

class _CheckReservationPageState extends State<_CheckReservationPage> {
  late final CheckReservationViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: SizeTheme.paddingMiddleSize),
          itemCount: _viewModel.reservationList.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              _CheckReservationItem(
                reservationDTO: _viewModel.reservationList[index],
                onCancelButtonClick: () => _viewModel.onCancelButtonClick(
                    context, _viewModel.reservationList[index].id),
              ),
              const SizedBox(height: SizeTheme.paddingLargeSize)
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckReservationItem extends StatelessWidget {
  final ReservationDTO reservationDTO;
  final Future Function() onCancelButtonClick;

  const _CheckReservationItem({
    Key? key,
    required this.reservationDTO,
    required this.onCancelButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: TitledOutlinedContainer(
            title: "Kumoh School Bus",
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: SizeTheme.paddingLargeSize * 2),
                  child: AppLogo(),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SizeTheme.paddingLargeSize * 2,
                      right: SizeTheme.paddingLargeSize * 2,
                      top: SizeTheme.paddingMiddleSize,
                      bottom: SizeTheme.paddingMiddleSize * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "From.",
                                text: reservationDTO.type == Direction.toDaegu
                                    ? "금오공대"
                                    : reservationDTO.station,
                              ),
                            ),
                            const SizedBox(width: SizeTheme.paddingLargeSize),
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "To.",
                                text: reservationDTO.type == Direction.toDaegu
                                    ? reservationDTO.station
                                    : "금오공대",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "By.",
                                text: reservationDTO.by,
                              ),
                            ),
                            const SizedBox(width: SizeTheme.paddingLargeSize),
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "When.",
                                text: reservationDTO.when,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "At.",
                                text: reservationDTO.at,
                              ),
                            ),
                            const SizedBox(width: SizeTheme.paddingLargeSize),
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "While.",
                                text: "${reservationDTO.taken}분",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: TitledOutlinedContainer(
            title: "",
            child: Padding(
              padding: const EdgeInsets.only(
                left: SizeTheme.paddingLargeSize,
                right: SizeTheme.paddingLargeSize,
                top: SizeTheme.paddingMiddleSize,
                bottom: SizeTheme.paddingMiddleSize * 2,
              ),
              child: Column(
                children: [
                  TitledText(title: "버스 번호", text: reservationDTO.by),
                  TitledText(title: "좌석", text: "${reservationDTO.seatNum}번"),
                  const SizedBox(height: SizeTheme.paddingMiddleSize),
                  CentralOutlinedButton(
                    onPressed: () async {
                      await _showCancelDialog(context);
                    },
                    text: '예약 취소',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showCancelDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '예약 취소',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  '예약을 취소하시겠습니다?',
                  style: TextStyleTheme.textMainStyleMiddle,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '예',
                style: TextStyleTheme.textMainStyleMiddle,
              ),
              onPressed: () {
                onCancelButtonClick();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                '아니요',
                style: TextStyleTheme.textMainStyleMiddle,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
