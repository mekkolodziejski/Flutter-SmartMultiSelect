# SmartMultiSelect

Simple

```
SmartMultiSelect(
 values: cars,
)
```
```
List<Item> cars = [
  Item(id: 1, name: 'BMW'),
  Item(id: 2, name: 'Mercedes'),
  Item(id: 3, name: 'Toyota'),
  Item(id: 4, name: 'Nissan'),
  Item(id: 5, name: 'Ferrari'),
  Item(id: 6, name: 'Ford'),
  Item(id: 7, name: 'Chevrolet'),
];
```
 
User

```
SmartMultiSelect(
 titleNoSelectedItems: Text('Select cars', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.yellow)),
 titleSelectedItems: Text('Selected cars', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.yellow)),
 backgroundColor: Colors.red,
 chipBorderColor: Colors.yellow,
 chipColor: Colors.brown,
 chipHeight: 25,
 chipTextStyle: TextStyle(fontSize: 12),
 chipSelectedBorderColor: Colors.black54,
 chipSelectedColor: Colors.grey,
 chipSelectedHeight: 60,
 chipSelectedTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
 buttonIcon: Icon(Icons.arrow_downward),
 bottomSheetBackgroundColor: Colors.red,
 buttonAcceptWidget: Text('Select'),
 initValues: [Item(id: 1, name: 'Audi'), Item(id: 13, name: 'Porsche'), Item(id: 8, name: 'Opel')],
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
)
```
```
return MaterialApp(
 title: 'Flutter Demo',
 debugShowCheckedModeBanner: false,
 theme: ThemeData(
  primarySwatch: Colors.blue,
  canvasColor: Colors.transparent, // important to rounded bottom sheet
  ),
 home: MyHomePage(),
);
```

![Screenshot_1621172443](https://user-images.githubusercontent.com/12680909/118401321-8983cb00-b665-11eb-8162-244b5ca48acc.png)
![Screenshot_1621172449](https://user-images.githubusercontent.com/12680909/118401325-8d175200-b665-11eb-9afc-9b437ae560d1.png)


![Screenshot_1621172455](https://user-images.githubusercontent.com/12680909/118401329-90124280-b665-11eb-910c-c3ceebc25120.png)
![Screenshot_1621172461](https://user-images.githubusercontent.com/12680909/118401332-91dc0600-b665-11eb-82b4-a3c5e52c1a1e.png)


![Screenshot_1621172693](https://user-images.githubusercontent.com/12680909/118401336-956f8d00-b665-11eb-847d-16071ffce2d5.png)
![Screenshot_1621172792](https://user-images.githubusercontent.com/12680909/118401339-97d1e700-b665-11eb-9bd1-b4a3cd5fa80c.png)


![Screenshot_1621172798](https://user-images.githubusercontent.com/12680909/118401343-99031400-b665-11eb-8613-05d05b036477.png)


