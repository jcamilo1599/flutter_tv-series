import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/use_case_config.dart';
import '../../../common/tokens/colors.dart';
import '../../../common/tokens/numbers.dart';

class LoginBody extends ConsumerWidget {
  LoginBody({Key? key}) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  // Determina si los botones del cuerpo se mostraran
  static final StateProvider<bool> buttonsProvider =
      StateProvider<bool>((_) => true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 40),
        Text(
          'Welcome!',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        _buildButton(
          ref,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Sign up',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 17,
                    color: TokensColors.black,
                  ),
            ),
          ),
        ),
        const SizedBox(height: TokensNum.mainSpacing),
        _buildButton(
          ref,
          child: ElevatedButton(
            onPressed: () => _onLogIn(context, ref),
            style: ElevatedButton.styleFrom(
              backgroundColor: TokensColors.white,
            ),
            child: Text(
              'Log in',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 17,
                    color: TokensColors.black,
                  ),
            ),
          ),
        ),
        const SizedBox(height: TokensNum.mainSpacing),
        _buildButton(
          ref,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildButton(WidgetRef ref, {required Widget child}) {
    final bool showButtons = ref.watch(buttonsProvider);

    return AnimatedOpacity(
      opacity: showButtons ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }

  void _onLogIn(BuildContext context, WidgetRef ref) {
    _config.loginUseCase.sheetLogin(context, onDismiss: () {
      ref.read(buttonsProvider.state).state = true;
    });

    ref.read(buttonsProvider.state).state = false;
  }
}
