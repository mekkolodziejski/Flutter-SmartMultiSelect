import 'package:flutter/material.dart';

import 'package:smartmultiselect/smartmultiselect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent, // important to rounded bottom sheet
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SmartMultiSelect',
              style: TextStyle(fontSize: 22.0, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              child: SmartMultiSelect(
                // titleNoSelectedItems: Text('Select cars', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.yellow)),
                // titleSelectedItems: Text('Selected cars', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.yellow)),
                // backgroundColor: Colors.red,
                // chipBorderColor: Colors.yellow,
                // chipColor: Colors.brown,
                // chipHeight: 25,
                // chipTextStyle: TextStyle(fontSize: 12),
                // chipSelectedBorderColor: Colors.black54,
                // chipSelectedColor: Colors.grey,
                // chipSelectedHeight: 60,
                // chipSelectedTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // buttonIcon: Icon(Icons.arrow_downward),
                // bottomSheetBackgroundColor: Colors.red,
                // buttonAcceptWidget: Text('Select'),
                // initValues: [Item(id: 1, name: 'Audi'), Item(id: 13, name: 'Porsche'), Item(id: 8, name: 'Opel')],
                values: cars,
                onSelect: (value) {
                  for(var itm in value) {
                    print(itm.name);
                  }
                },
                onDelete: (value) {
                  for(var itm in value) {
                    print(itm.name);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Item> cars = [
  Item(id: 1, name: 'Audi'),
  Item(id: 2, name: 'BMW'),
  Item(id: 3, name: 'Mercedes'),
  Item(id: 4, name: 'Citroen'),
  Item(id: 5, name: 'Peugeot'),
  Item(id: 6, name: 'Renault'),
  Item(id: 7, name: 'Volvo'),
  Item(id: 8, name: 'Opel'),
  Item(id: 9, name: 'Mazda'),
  Item(id: 10, name: 'Toyota'),
  Item(id: 11, name: 'Nissan'),
  Item(id: 12, name: 'Ferrari'),
  Item(id: 13, name: 'Porsche'),
  Item(id: 14, name: 'Lamborghini'),
  Item(id: 15, name: 'Ford'),
  Item(id: 16, name: 'Chevrolet'),
];