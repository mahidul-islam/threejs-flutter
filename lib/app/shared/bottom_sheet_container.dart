import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    Key? key,
    required this.child,
    this.height,
    this.color = Colors.white,
    this.visibleHandle = false,
  }) : super(key: key);

  factory BottomSheetContainer.confirm({
    required String title,
    String description = '',
    required String buttonTitle,
    bool showConfirmButton = true,
    bool isDisabled = false,
    Widget? child,
    VoidCallback? onPressed,
    Widget? header,
  }) {
    return BottomSheetContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (header != null) ...<Widget>[
              header,
              const SizedBox(width: 16, height: 16),
            ],
            if (title.isNotEmpty) ...<Widget>[
              Text(
                title,
              ),
              const SizedBox(width: 8, height: 8),
            ],
            if (description.isNotEmpty) ...<Widget>[
              Text(
                description,
              ),
              const SizedBox(width: 20, height: 20),
            ],
            if (child != null) ...<Widget>[
              child,
              const SizedBox(width: 16, height: 16),
            ],
            // ElevatedButton(onPressed: onPressed, child: Text(buttonTitle)),
          ],
        ),
      ),
    );
  }

  final Widget child;
  final double? height;
  final Color? color;
  final bool visibleHandle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: color,
      ),
      padding: EdgeInsets.only(
        top: 24,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      child: Wrap(
        children: <Widget>[
          if (visibleHandle) ...<Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 72,
                height: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}
