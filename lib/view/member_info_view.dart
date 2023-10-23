import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/member_info_dto.dart';
import 'package:kumoh_school_bus/model/dto/reservation_chart_dto.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view_model/member_info_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MemberInfoView extends StatelessWidget {
  const MemberInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberInfoViewModel>(
      create: (_) => MemberInfoViewModel(),
      child: Consumer<MemberInfoViewModel>(
        builder: (context, provider, child) => _MemberInfoPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _MemberInfoPage extends StatefulWidget {
  final MemberInfoViewModel viewModel;

  const _MemberInfoPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends State<_MemberInfoPage> {
  late final MemberInfoViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Column(
          children: [
            MemberInfoItem(
              userInfoDTO: _viewModel.memberInfoDTO!,
              onRemoveButtonClick: () =>
                  _viewModel.onRemoveButtonClick(context, mounted),
              onEditButtonClick: () => _viewModel.onEditButtonClick(context, mounted),
              passwordController: _viewModel.passwordController,
              checkPasswordController: _viewModel.checkPasswordController,
            ),
            const SizedBox(height: SizeTheme.paddingLargeSize),
            SfCartesianChart(
              // Initialize category axis
              title: ChartTitle(text: '지난 예약 기록'),
              zoomPanBehavior: ZoomPanBehavior(
                // Enables pinch zooming
                enableMouseWheelZooming: true,
                enablePinching: true,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                // Initialize line series
                LineSeries<ReservationChartDTO, String>(
                  name: '날짜',
                  enableTooltip: true,
                  dataSource: _viewModel.reservationCharDTOList,
                  xValueMapper: (ReservationChartDTO days, _) => days.day,
                  yValueMapper: (ReservationChartDTO days, _) => days.count,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MemberInfoItem extends StatelessWidget {
  final MemberInfoDTO userInfoDTO;
  final Future Function() onEditButtonClick;
  final Future Function() onRemoveButtonClick;
  final TextEditingController passwordController;
  final TextEditingController checkPasswordController;

  const MemberInfoItem({
    Key? key,
    required this.userInfoDTO,
    required this.onRemoveButtonClick,
    required this.onEditButtonClick,
    required this.passwordController,
    required this.checkPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorTheme.itemMainColor,
            borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: ColorTheme.backgroundMainColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitledText(
                        title: "이름",
                        text: userInfoDTO.name,
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                      const SizedBox(height: SizeTheme.paddingMiddleSize),
                      TitledText(
                        title: "학번",
                        text: userInfoDTO.id,
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                      const SizedBox(height: SizeTheme.paddingMiddleSize),
                      TitledText(
                        title: "학과",
                        text: userInfoDTO.major.toString(),
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: SizeTheme.paddingSmallSize,
          right: SizeTheme.paddingLargeSize,
          child: Row(
            children: [
              IconButton(
                onPressed: () => _showEditDialog(context),
                icon: const Icon(Icons.edit),
              ),
              const SizedBox(width: SizeTheme.paddingMiddleSize),
              IconButton(
                onPressed: () => _showRemoveDialog(context),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showEditDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '비밀번호 변경',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TitledTextFormField(
                  labelText: "비밀번호",
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  validator: null,
                  controller: passwordController,
                ),
                TitledTextFormField(
                  labelText: "비밀번호",
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  validator: null,
                  controller: checkPasswordController,
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
              onPressed: () async {
                Navigator.of(context).pop();
                await onEditButtonClick();
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

  Future<void> _showRemoveDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '회원 탈퇴',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  "정말 탈퇴하시겠습니까?",
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
              onPressed: () async {
                Navigator.of(context).pop();
                await onRemoveButtonClick();
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
