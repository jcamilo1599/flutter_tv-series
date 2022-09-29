import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/tokens/colors.dart';

class LoginSheet extends ConsumerWidget {
  final Null Function() onDismiss;

  LoginSheet({
    required this.onDismiss,
    Key? key,
  }) : super(key: key);

  final FocusNode focusName = FocusNode();
  final FocusNode focusPass = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            autocorrect: false,
            focusNode: focusName,
            controller: controllerName,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 40),
          TextField(
            autocorrect: false,
            focusNode: focusPass,
            controller: controllerPass,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: TokensColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50),
            ),
            child: Text(
              'Log in',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 17,
                    color: TokensColors.black,
                  ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
