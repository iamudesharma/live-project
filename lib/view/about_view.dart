
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 500,
        width: 500,
        // child: getMap(),
      ),
    );
  }
}

// Widget getMap() {
//   String htmlId = "7";

//   // ignore: undefined_prefixed_name
//   ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
//     final myLatlng = LatLng(26.758589654805508, 83.36863553670076);

//     final mapOptions = MapOptions()
//       ..zoom = 10
//       ..center = LatLng(26.758589654805508, 83.36863553670076);

//     final elem = DivElement()
//       ..id = htmlId
//       ..style.width = "100%"
//       ..style.height = "100%"
//       ..style.border = 'none';

//     final map = GMap(elem, mapOptions);

//     Marker(MarkerOptions()
//       ..position = myLatlng
//       ..map = map
//       ..title = 'Hello World!');

//     return elem;
//   });

//   return HtmlElementView(viewType: htmlId);
// }
