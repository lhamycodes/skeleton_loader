import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../models/states.dart';

class GridExample extends StatefulWidget {
  final List<StateCapital> stateCapitals;

  const GridExample({
    Key? key,
    required this.stateCapitals,
  }) : super(key: key);

  @override
  _GridExampleState createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  var _isLoading = true, _isInit = false;
  List<StateCapital> _myItemsList = [];

  @override
  void initState() {
    if (!_isInit) {
      _simulateLoad();
    }
    _isInit = true;
    super.initState();
  }

  Future _simulateLoad() async {
    Future.delayed(Duration(seconds: 5), () {
      _myItemsList = widget.stateCapitals;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(7),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return SkeletonGridLoader(
        builder: Card(
          color: Colors.transparent,
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Container(
                  width: 70,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        items: 9,
        itemsPerRow: 3,
        period: Duration(seconds: 2),
        highlightColor: Colors.lightBlue[300]!,
        direction: SkeletonDirection.ltr,
        childAspectRatio: 1,
      );
    } else {
      return GridView.builder(
        itemBuilder: (ctx, i) {
          StateCapital sc = _myItemsList[i];
          return Card(
            child: GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(sc.name!),
                  Text(sc.capital!),
                ],
              ),
            ),
          );
        },
        itemCount: _myItemsList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      );
    }
  }
}
