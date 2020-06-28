# skeleton_loader

A Flutter Package which provides a fully customizable loading skeleton for your app,

## Installation

How to install it? [Follow Instructions](https://pub.dev/packages/skeleton_loader#-installing-tab-)

## Preview
<p>
    <img src="https://github.com/lhamycodes/skeloton_loader/blob/master/screenshots/screen.gif" width="200px" height="auto" hspace="20"/>
</p>

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../models/states.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      _myItemsList = [
        StateCapital(name: "Abia", capital: "Umuahia"),
        StateCapital(name: "Adamawa", capital: "Yola"),
        StateCapital(name: "Akwa-Ibom", capital: "Uyo"),
        StateCapital(name: "Anambra", capital: "Awka"),
        StateCapital(name: "Bauchi", capital: "Bauchi"),
        StateCapital(name: "Bayelsa", capital: "Yenagoa"),
        StateCapital(name: "Benue", capital: "Makurdi"),
        StateCapital(name: "Borno", capital: "Maiduguri"),
        StateCapital(name: "Cross River", capital: "Calabar"),
        StateCapital(name: "Delta", capital: "Asaba"),
        StateCapital(name: "Ebonyi", capital: "Abakaliki"),
        StateCapital(name: "Edo", capital: "Benin"),
        StateCapital(name: "Ekiti", capital: "Ado-Ekiti"),
        StateCapital(name: "Enugu", capital: "Enugu"),
        StateCapital(name: "FCT", capital: "Abuja"),
        StateCapital(name: "Gombe", capital: "Gombe"),
        StateCapital(name: "Imo", capital: "Owerri"),
        StateCapital(name: "Jigawa", capital: "Dutse"),
        StateCapital(name: "Kaduna", capital: "Kaduna"),
        StateCapital(name: "Kano", capital: "Kano"),
        StateCapital(name: "Katsina", capital: "Katsina"),
        StateCapital(name: "Kebbi", capital: "Birnin-Kebbi"),
        StateCapital(name: "Kogi", capital: "Lokoja"),
        StateCapital(name: "Kwara", capital: "Ilorin"),
        StateCapital(name: "Lagos", capital: "Ikeja"),
        StateCapital(name: "Nassarawa", capital: "Lafia"),
        StateCapital(name: "Niger", capital: "Mina"),
        StateCapital(name: "Ogun", capital: "Abeokuta"),
        StateCapital(name: "Ondo", capital: "Akure"),
        StateCapital(name: "Osun", capital: "Osogbo"),
        StateCapital(name: "Oyo", capital: "Ibadan"),
        StateCapital(name: "Plateau", capital: "Jos"),
        StateCapital(name: "Rivers", capital: "Port Harcourt"),
        StateCapital(name: "Sokoto", capital: "Sokoto"),
        StateCapital(name: "Taraba", capital: "Jalingo"),
        StateCapital(name: "Yobe", capital: "Damaturu"),
        StateCapital(name: "Zamfara", capital: "Gusau"),
      ];
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: _buildBody(),
        ),
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
        hightlightColor: Colors.lightBlue[300],
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
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
