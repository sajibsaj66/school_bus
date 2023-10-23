import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:provider/provider.dart';

import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, provider, child) => _LoginPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;

  const _LoginPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  late final LoginViewModel _viewModel = widget.viewModel;

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
              labelText: "ID",
              hintText: "ID",
              prefixIcon: Icons.person,
              keyboardType: TextInputType.text,
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
            Hero(
              tag: "Button",
              child: CentralOutlinedButton(
                onPressed: () => _viewModel.login(context, mounted),
                text: "로그인",
              ),
            ),
            const SizedBox(height: SizeTheme.paddingMiddleSize),
            VanillaTextButton(
              onPressed: () => _viewModel.navigateToUserSignupPage(context),
              text: "회원이 아니신가요?",
            ),
          ],
        ),
      ),
    );
  }
}
