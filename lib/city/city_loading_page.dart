import 'package:flutter/material.dart';

import '../shared/widgets/centered_page.dart';

class MyCityLoadinagPage extends StatelessWidget {
  const MyCityLoadinagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCenteredPage(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .10,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
