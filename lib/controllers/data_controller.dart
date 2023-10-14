import 'package:flutter/material.dart';

class DataController<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T data) successWidget;
  final Widget Function(dynamic error)? errorWidget;
  final Widget? emptyWidget;

  const DataController({
    super.key,
    required this.future,
    required this.successWidget,
    this.errorWidget,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.none:
            return const Center(
              child: Text('No internet connection'),
            );
          case ConnectionState.done:
            if(snapshot.hasError) {
              return emptyWidget != null
                  ? errorWidget!(snapshot.error)
                  : const Center(child: Text('snapshot.error'));
            } else {
              final data = snapshot.data;

              if(data == null) {
                return emptyWidget != null
                    ? emptyWidget!
                    : const Center(child: Text('No data'));
              }

              return successWidget(data);

            }
          default:
            return Container();
        }
      },
    );
  }
}