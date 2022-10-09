import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/use_case_config.dart';
import '../../../../domain/models/login/login.dart';
import '../../../common/tokens/colors.dart';
import '../../../common/tokens/numbers.dart';

class LoginSheet extends ConsumerStatefulWidget {
  final Null Function() onDismiss;

  const LoginSheet({
    required this.onDismiss,
    Key? key,
  }) : super(key: key);

  static final StateProvider<bool> loadingProvider =
      StateProvider<bool>((_) => false);

  @override
  _LoginSheetState createState() => _LoginSheetState();
}

class _LoginSheetState extends ConsumerState<LoginSheet> {
  final UseCaseConfig _config = UseCaseConfig();

  // Campos de texto
  late final FocusNode focusName;
  late final FocusNode focusPass;
  late final TextEditingController controllerName;
  late final TextEditingController controllerPass;

  @override
  void initState() {
    super.initState();

    focusName = FocusNode();
    focusPass = FocusNode();
    controllerName = TextEditingController();
    controllerPass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final bool showLoading = ref.watch(LoginSheet.loadingProvider);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: TokensColors.black.withOpacity(.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          22,
          22,
          22,
          MediaQuery.of(context).viewInsets.bottom + 80,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: TokensColors.gray,
                onPressed: () {
                  Navigator.pop(context);
                  widget.onDismiss();
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              enabled: !showLoading,
              autocorrect: false,
              focusNode: focusName,
              controller: controllerName,
              keyboardType: TextInputType.text,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: const InputDecoration(hintText: 'Name'),
              onSubmitted: (String value) =>
                  FocusScope.of(context).requestFocus(focusPass),
            ),
            const SizedBox(height: 40),
            TextField(
              enabled: !showLoading,
              obscureText: true,
              autocorrect: false,
              focusNode: focusPass,
              controller: controllerPass,
              keyboardType: TextInputType.text,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: const InputDecoration(hintText: 'Password'),
              onSubmitted: (_) => _onLogIn(context, ref),
            ),
            const SizedBox(height: 60),
            _buildButton(context, ref, show: showLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    WidgetRef ref, {
    required bool show,
  }) {
    return ElevatedButton(
      onPressed: !show ? () => _onLogIn(context, ref) : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: TokensColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildText(),
          _buildLoading(show)
        ],
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'Log in',
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 17,
        color: TokensColors.black,
      ),
    );
  }

  Widget _buildLoading(bool show) {
    Widget response = const SizedBox.shrink();

    if (show) {
      response = Container(
        width: TokensNum.mainSpacing,
        height: TokensNum.mainSpacing,
        margin: const EdgeInsets.only(left: 14),
        child: const CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return response;
  }

  void _onLogIn(BuildContext context, WidgetRef ref) {
    ref.read(LoginSheet.loadingProvider.state).state = true;

    final LoginModel data = LoginModel(
      name: controllerName.text,
      pass: controllerPass.text,
    );

    _config.loginUseCase.login(ref, context, loginData: data);
  }
}
