import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key, required this.child}) : super(key: key);

  factory BottomSheetContent.intSingleNumberSpinner({
    required RxDouble number,
    required String unit,
    double minNumber = 100,
    double maxNumber = 1000,
    int skipBetween = 10,
    Function(double)? onChanged,
  }) {
    return BottomSheetContent(child: StatefulBuilder(
      builder: (_, Function spinnerState) {
        return SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: (number.value - minNumber) ~/ skipBetween,
                  ),
                  onSelectedItemChanged: (int x) {
                    number.value = (x * skipBetween) + minNumber;
                    onChanged?.call((x * skipBetween) + minNumber);
                  },
                  itemExtent: 30,
                  children: List<Widget>.generate(
                    (maxNumber - minNumber) ~/ skipBetween,
                    (int index) => Text(
                      '${(index * skipBetween) + minNumber}',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (int x) {},
                  itemExtent: 30,
                  children: <Widget>[
                    Text(
                      unit,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}
