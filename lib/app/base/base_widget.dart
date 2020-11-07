import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// StatefulWidget for T type of Viewmodel / ChangeNotifier
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T viewModel;
  final Widget child;
  final Function(T) onModelReady;

  BaseWidget(
      {Key key,
      @required this.builder,
      @required this.viewModel,
      this.child,
      this.onModelReady})
      : super(key: key);

  @override
  _BaseWidget<T> createState() => _BaseWidget<T>();
}

/// State of StatefulWidget of T type of Viewmodel / ChangeNotifier
class _BaseWidget<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;
    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: _model,
      child: Consumer<T>(
          builder: (context, model, child) {
            return widget.builder(context, model, child);
          },
          child: widget.child),
    );
  }
}
