import 'package:flutter/material.dart';

import '../../models/item.dart';

class EntryForm extends StatefulWidget {
  late Item? item;
  EntryForm({Key? key, required this.item}) : super(key: key);

  @override
  State<EntryForm> createState() => EntryFormState();
}

class EntryFormState extends State<EntryForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController itemcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.item != null) {
      nameController.text = widget.item!.name;
      priceController.text = widget.item!.price.toString();
      stockController.text = widget.item!.stock.toString();
      itemcodeController.text = widget.item!.itemCode;
    }
    return Scaffold(
      appBar: AppBar(
        title: widget.item == null ? const Text('Tambah') : const Text('Ubah'),
        leading: const Icon(Icons.keyboard_arrow_left),
      ),
      body: ListView(
        children: <Widget>[
          // nama barang
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) {
                  // TODO: method untuk form nama barang
                }),
          ),
          // harga barang
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Harga Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) {
                  // TODO: method untuk form harga barang
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Stok Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) {
                  // TODO: method untuk form harga barang
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
                controller: itemcodeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) {
                  // TODO: method untuk form nama barang
                }),
          ),
          // tombol button
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: <Widget>[
                // tombol simpan
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'Save',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      if (widget.item == null) {
                        // tambah data
                        widget.item = Item(
                            name: nameController.text,
                            price: int.parse(priceController.text),
                            stock: int.parse(stockController.text),
                            itemCode: itemcodeController.text);
                      } else {
                        // ubah data
                        widget.item!.name = nameController.text;
                        widget.item!.price = int.parse(priceController.text);
                        widget.item!.stock = int.parse(stockController.text);
                        widget.item!.itemCode = itemcodeController.text;
                      }
                      // kembali ke layar sebelumnya dengan membawa objek item
                      Navigator.pop(context, widget.item);
                    },
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                // tombol batal
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'Cancel',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
