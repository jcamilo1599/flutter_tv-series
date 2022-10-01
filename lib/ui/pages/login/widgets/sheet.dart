import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/use_case_config.dart';
import '../../../../domain/models/login/login.dart';
import '../../../common/tokens/colors.dart';

class LoginSheet extends ConsumerWidget {
  final Null Function() onDismiss;

  LoginSheet({
    required this.onDismiss,
    Key? key,
  }) : super(key: key);

  // Determina si mostrara o no la animación de cargando
  static final StateProvider<bool> loadingProvider =
      StateProvider<bool>((_) => false);

  final UseCaseConfig _config = UseCaseConfig();

  final FocusNode focusName = FocusNode();
  final FocusNode focusPass = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showLoading = ref.watch(loadingProvider);

    return Container(
      decoration: BoxDecoration(
        color: TokensColors.black.withOpacity(.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: TokensColors.gray,
              onPressed: () {
                Navigator.pop(context);
                onDismiss();
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
          ),
          const Spacer(),
          _buildButton(context, ref, show: showLoading),
          const SizedBox(height: 60),
        ],
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
          Text(
            'Log in',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 17,
                  color: TokensColors.black,
                ),
          ),
          _buildLoading(show)
        ],
      ),
    );
  }

  Widget _buildLoading(bool show) {
    Widget response = const SizedBox.shrink();

    if (show) {
      response = Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.only(left: 14),
        child: const CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return response;
  }

  void _onLogIn(BuildContext context, WidgetRef ref) {
    ref.read(loadingProvider.state).state = true;

    final LoginModel data = LoginModel(
      name: controllerName.text,
      pass: controllerPass.text,
    );

    _config.loginUseCase.login(ref, context, loginData: data);
  }
}
