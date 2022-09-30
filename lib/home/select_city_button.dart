import 'package:flutter/material.dart';

import '../city/city_modal.dart';

class MySelectCityButton extends StatelessWidget {
  const MySelectCityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .75,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
              ),
              builder: (_) {
                return Padding(
                  padding: MediaQuery.of(context).viewPadding,
                  child: const MyCityModal(),
                );
              },
            );
          },
          child: const Text('Select City'),
        ),
      ),
    );
  }
}
