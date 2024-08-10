import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitle_isar/path_file.dart';

class BaseView<T extends BaseNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final T? model;
  final Widget? child;
  final Function(T)? onModelReady;

  const BaseView({
    super.key,
    this.model,
    required this.builder,
    this.child,
    this.onModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseNotifier> extends State<BaseView<T>> {
  T? model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady!(model!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model!;
      },
    );
  }
}
