import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/widgets/centered_page.dart';
import 'controllers/city_controller.dart';

class MyCityFailurePage extends StatelessWidget {
  const MyCityFailurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCenteredPage(
      child: TextButton(
        onPressed: context.read<CityController>().loadCities,
        child: const Text("Couldn't load cities. Tap to retry."),
      ),
    );
  }
}
