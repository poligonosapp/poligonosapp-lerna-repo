// cool_widget.dart

 import 'package:react/react.dart';

 class CoolWidgetComponent extends Component2 {
   // render() => div({}, "CoolWidgetComponent");
   @override
  render() {
    return div({}, props['text']);
  }
 }

var CoolWidget = registerComponent2(() => CoolWidgetComponent());


