import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  int id;
  String name;

  Item({
    this.id,
    this.name,
  });
}

class ItemTemp {
  int id;
  String name;
  bool selected;

  ItemTemp({this.id, this.name, this.selected});
}

class SmartMultiSelect extends StatefulWidget {
  final Text titleNoSelectedItems;
  final Text titleSelectedItems;
  final Icon buttonIcon;
  final Color backgroundColor;
  final Color bottomSheetBackgroundColor;
  final Widget buttonAcceptWidget;
  final Color chipColor;
  final Color chipBorderColor;
  final TextStyle chipTextStyle;
  final double chipHeight;
  final Color chipSelectedColor;
  final Color chipSelectedBorderColor;
  final TextStyle chipSelectedTextStyle;
  final double chipSelectedHeight;
  final List<Item> values;
  final List<Item> initValues;
  final ValueChanged<List<ItemTemp>> onSelect;
  final ValueChanged<List<ItemTemp>> onDelete;

  const SmartMultiSelect(
      {Key key,
      this.titleNoSelectedItems,
      this.titleSelectedItems,
      this.buttonIcon,
      this.backgroundColor,
      this.bottomSheetBackgroundColor,
      this.buttonAcceptWidget,
      this.chipColor,
      this.chipBorderColor,
      this.chipTextStyle,
      this.chipHeight,
      this.chipSelectedColor,
      this.chipSelectedBorderColor,
      this.chipSelectedTextStyle,
      this.chipSelectedHeight,
      this.values,
      this.initValues,
      this.onSelect,
      this.onDelete})
      : super(key: key);

  @override
  SmartMultiSelectState createState() => SmartMultiSelectState(
      titleNoSelectedItems: this.titleNoSelectedItems,
      titleSelectedItems: this.titleSelectedItems,
      buttonIcon: this.buttonIcon,
      backgroundColor: this.backgroundColor,
      bottomSheetBackgroundColor: this.bottomSheetBackgroundColor,
      buttonAcceptWidget: this.buttonAcceptWidget,
      chipColor: this.chipColor,
      chipBorderColor: this.chipBorderColor,
      chipTextStyle: this.chipTextStyle,
      chipHeight: this.chipHeight,
      chipSelectedColor: this.chipSelectedColor,
      chipSelectedBorderColor: this.chipSelectedBorderColor,
      chipSelectedTextStyle: this.chipSelectedTextStyle,
      chipSelectedHeight: this.chipSelectedHeight,
      values: this.values,
      initValues: this.initValues,
      onSelect: this.onSelect,
      onDelete: this.onDelete);
}

class SmartMultiSelectState extends State<SmartMultiSelect> {
  final Text titleNoSelectedItems;
  final Text titleSelectedItems;
  final Icon buttonIcon;
  final Color backgroundColor;
  final Color bottomSheetBackgroundColor;
  final Widget buttonAcceptWidget;
  final Color chipColor;
  final Color chipBorderColor;
  final TextStyle chipTextStyle;
  final double chipHeight;
  final Color chipSelectedColor;
  final Color chipSelectedBorderColor;
  final TextStyle chipSelectedTextStyle;
  final double chipSelectedHeight;
  final List<Item> values;
  final List<Item> initValues;
  final ValueChanged<List<ItemTemp>> onSelect;
  final ValueChanged<List<ItemTemp>> onDelete;

  SmartMultiSelectState(
      {this.titleNoSelectedItems,
      this.titleSelectedItems,
      this.buttonIcon,
      this.backgroundColor,
      this.bottomSheetBackgroundColor,
      this.buttonAcceptWidget,
      this.chipColor,
      this.chipBorderColor,
      this.chipTextStyle,
      this.chipHeight,
      this.chipSelectedColor,
      this.chipSelectedBorderColor,
      this.chipSelectedTextStyle,
      this.chipSelectedHeight,
      this.values,
      this.initValues,
      this.onSelect,
      this.onDelete});

  List<ItemTemp> items = [];
  bool isSaved = false;
  List<ItemTemp> _selectedItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(initValues != null) {
      if (initValues.length > 0) {
        for (var itm in values) {
          bool exist = false;
          for (var it in initValues) {
            if (itm.id == it.id) {
              ItemTemp it = new ItemTemp(id: itm.id, name: itm.name, selected: true);
              items.add(it);
              _selectedItems.add(it);
              exist = true;
              break;
            }
          }
          if (!exist) {
            ItemTemp it = new ItemTemp(id: itm.id, name: itm.name, selected: false);
            items.add(it);
          }
        }
        setState(() {
          isSaved = true;
        });
      }
    }
  }

  Future<void> _reloadData() {
    items.clear();
    for (var itm in values) {
      ItemTemp it = new ItemTemp(id: itm.id, name: itm.name, selected: false);
      items.add(it);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: backgroundColor == null ? Colors.white : backgroundColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        new Row(
          children: <Widget>[
            Expanded(
              child: _selectedItems.length < 1
                  ? titleNoSelectedItems == null
                      ? Text('Select items')
                      : titleNoSelectedItems
                  : titleSelectedItems == null
                      ? Text('Items selected')
                      : titleSelectedItems,
            ),
            IconButton(
                icon: buttonIcon == null ? Icon(Icons.arrow_drop_down) : buttonIcon,
                onPressed: () async {
                  if (!isSaved) {
                    await _reloadData();
                  }
                  _list();
                }),
          ],
        ),
        _selectedItems.length > 0
            ? new Container(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: _renderSelectedItems(setState),
                ),
              )
            : Container()
      ]),
    );
  }

  List<Widget> _renderAllItems(StateSetter setStates) {
    return items.asMap().keys.toList().map((index) {
      return GestureDetector(
        onTap: () {
          setStates(() {
            items[index].selected = !items[index].selected;
          });
          if (items[index].selected) {
            _selectedItems.add(items[index]);
            items[index].selected = true;
          } else {
            _selectedItems.remove(items[index]);
            items[index].selected = false;
          }
        },
        child: FittedBox(
          child: Container(
            height: items[index].selected
                ? chipSelectedHeight == null
                    ? 30.0
                    : chipSelectedHeight
                : chipHeight == null
                    ? 30.0
                    : chipHeight,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: items[index].selected
                    ? chipSelectedBorderColor == null
                        ? Colors.red
                        : chipSelectedBorderColor
                    : chipBorderColor == null
                        ? Colors.blue
                        : chipBorderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: items[index].selected
                  ? chipSelectedColor == null
                      ? Colors.red
                      : chipSelectedColor
                  : chipColor == null
                      ? Colors.blue
                      : chipColor,
            ),
            child: Center(
              child: Text(items[index].name,
                  style: items[index].selected
                      ? chipSelectedTextStyle == null
                          ? TextStyle(color: Colors.white)
                          : chipSelectedTextStyle
                      : chipTextStyle == null
                          ? TextStyle(color: Colors.white)
                          : chipTextStyle),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _renderSelectedItems(StateSetter setStates) {
    return _selectedItems.asMap().keys.toList().map((index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            for (var itm in items) {
              if (itm.id == _selectedItems[index].id) {
                itm.selected = false;
                break;
              }
            }
            _selectedItems.remove(_selectedItems[index]);
          });
          _delete();
        },
        child: FittedBox(
          child: Container(
            height: chipHeight == null ? 30.0 : chipHeight,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: chipBorderColor == null ? Colors.blue : chipBorderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: chipColor == null ? Colors.blue : chipColor,
            ),
            child: Center(
              child: Text(_selectedItems[index].name,
                  style: chipTextStyle == null ? TextStyle(color: Colors.white) : chipTextStyle),
            ),
          ),
        ),
      );
    }).toList();
  }

  _accept() {
    setState(() {
      isSaved = true;
    });
    onSelect(_selectedItems);
    Navigator.pop(context);
  }

  _delete() {
    onDelete(_selectedItems);
  }

  _list() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStates /*You can rename this!*/) {
            return new Container(
              color: Colors.transparent,
              child: new Container(
                decoration: new BoxDecoration(
                    color: bottomSheetBackgroundColor == null
                        ? Colors.white
                        : bottomSheetBackgroundColor,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Container(
                  margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      new Container(
                        child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: _renderAllItems(setStates)),
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomCenter,
                        margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0, top: 30.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          new GestureDetector(child: Text('')),
                          new GestureDetector(
                              onTap: () {
                                _accept();
                              },
                              child: buttonAcceptWidget == null
                                  ? Text('Select',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))
                                  : buttonAcceptWidget),
                        ]),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          });
        });
  }
}
