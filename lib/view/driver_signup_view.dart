import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view_model/driver_signup_view_model.dart';
import 'package:provider/provider.dart';

import '../theme/themes.dart';
import 'common/commons.dart';

class DriverSignupView extends StatelessWidget {
  const DriverSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DriverSignupViewModel>(
      create: (_) => DriverSignupViewModel(),
      child: Consumer<DriverSignupViewModel>(
        builder: (context, provider, child) => _DriverSignupPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _DriverSignupPage extends StatefulWidget {
  final DriverSignupViewModel viewModel;

  const _DriverSignupPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_DriverSignupPage> createState() => _DriverSignupPageState();
}

class _DriverSignupPageState extends State<_DriverSignupPage> {
  late final DriverSignupViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(tag: "AppLogo", child: AppLogo()),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            TitledTextFormField(
              labelText: "전화번호",
              hintText: "Phone Number",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.number,
              validator: null,
              controller: _viewModel.idController,
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            TitledTextFormField(
              labelText: "비밀번호",
              hintText: "Password",
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              validator: null,
              controller: _viewModel.passwordController,
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            TitledTextFormField(
              labelText: "비밀번호 확인",
              hintText: "Check Password",
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              validator: null,
              controller: _viewModel.checkPasswordController,
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            TitledTextFormField(
              labelText: "이름",
              hintText: "Name",
              prefixIcon: Icons.assignment_ind,
              keyboardType: TextInputType.text,
              validator: null,
              controller: _viewModel.nameController,
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            Hero(
              tag: "Button",
              child: CentralOutlinedButton(
                  onPressed: () => _viewModel.signup(context, mounted), text: "회원가입"),
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            VanillaTextButton(
                onPressed: () => _viewModel.navigatePop(context),
                text: "이미 회원이신가요?"),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
          ],
        ),
      ),
    );
  }
}
