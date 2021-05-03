// app.dart

 import 'dart:html';

 import 'package:react/react.dart';
 import 'package:react/react_dom.dart' as react_dom;

 import 'cool_widget.dart';

 main() {
   react_dom.render(CoolWidget({}), querySelector('#react_mount_point'));
 }

 