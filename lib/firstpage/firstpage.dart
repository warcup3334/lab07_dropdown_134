import "package:flutter/material.dart";

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
 List<ListItem> foodType = [
  ListItem("Yum", "ยำ"),  
  ListItem("Tomyum", "ต้มยำ"),  
  ListItem("JanDeaw", "จานเดียว"),  
  ListItem("Somtam", "ส้มตำ"),  
];

List<DropdownMenuItem<ListItem>> _dropdowmMenuItems = [];

ListItem? _selecetedItem;

  get value => null;

List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(List<ListItem> foodType) {
  
  List<DropdownMenuItem<ListItem>> Items = [];
  for (ListItem ft in foodType) {
    Items.add(DropdownMenuItem(
      value: ft,
      child: Text(ft.name),
      )
      );
  }
  return Items;
}

void initState() {
  super.initState();
  _dropdowmMenuItems = buildDropdownMenuItem(foodType);
  _selecetedItem = _dropdowmMenuItems[0].value;
  
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Lab07 Dropdown"),
      ),
      body: Column(
        children: [
          const Text("Choose Food Type"),
          DropdownButton(value: _selecetedItem, items: _dropdowmMenuItems, onChanged: (value){
            setState(() {
              _selecetedItem = value as ListItem?;
            });
          }),
          Text("Select Food Type: ${_selecetedItem?.name ?? ''}"),
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}