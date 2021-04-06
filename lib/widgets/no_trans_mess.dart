import 'package:flutter/material.dart';
class NoTransactionMessage extends StatelessWidget {
  const NoTransactionMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
        return Column(
          children: [
             Text(
              'No Transactions added!',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(
              height: 20,
            ),
             Container(
                height: constraints.maxHeight * 0.7,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover))
          ],
        );
      });
  }
}

