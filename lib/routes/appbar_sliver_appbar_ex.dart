import 'package:flutter/material.dart';
import '../my_route.dart';

// Adapted from offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/bottom_app_bar_demo.dart
class SliverAppBarExample extends MyRoute {
  const SliverAppBarExample(
      [String sourceFile = 'lib/routes/appbar_sliver_appbar_ex.dart'])
      : super(sourceFile);

  @override
  get title => 'Sliver AppBar';

  @override
  get description => 'Appbar that auto-hides.';

  @override
  get links => {
        'Doc':
            'https://docs.flutter.io/flutter/material/SliverAppBar-class.html',
        'Medium article':
            'https://flutterdoc.com/animating-app-bars-in-flutter-cf034cd6c68b',
      };

  @override
  Widget buildMyRouteContent(BuildContext context) {
    return _SliverAppbarPage();
  }
}

class _SliverAppbarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverAppbarPageState();
}

class _SliverAppbarPageState extends State<_SliverAppbarPage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FlexibleSpace title"),
              background: Image.asset(
                'res/images/material_design_3.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Center(child: Text("Hello")),
          ),
        ],
      ),
      bottomNavigationBar: this._getBottomAppBar(),
    );
  }

  Widget _getBottomAppBar() {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('pinned'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._pinned = val;
                  });
                },
                value: this._pinned,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('snap'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._snap = val;
                    // **Snapping only applies when the app bar is floating.**
                    this._floating = this._floating || val;
                  });
                },
                value: this._snap,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('floating'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._floating = val;
                  });
                },
                value: this._floating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
