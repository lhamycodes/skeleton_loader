import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../models/states.dart';

class ListExample extends StatefulWidget {
  final List<StateCapital> stateCapitals;

  const ListExample({
    Key key,
    @required this.stateCapitals,
  }) : super(key: key);

  @override
  _ListExampleState createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return SkeletonLoader(
        builder: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 10,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        items: 10,
        period: Duration(seconds: 2),
        highlightColor: Colors.lightBlue[300],
        direction: SkeletonDirection.ltr,
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          StateCapital sc = _myItemsList[i];
          return ListTile(
            leading: CircleAvatar(
              child: Text("${i + 1}"),
            ),
            title: Text(sc.name),
            subtitle: Text(sc.capital),
          );
        },
        itemCount: _myItemsList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    }
  }
}
