import 'package:akur_crud/Model/produk_model.dart';
import 'package:akur_crud/Providers/produk_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCardProduk extends StatefulWidget {
  String? title;
  ProdukProvider? produkProvider;
  Datum? data;

  AddCardProduk({this.title, this.produkProvider, this.data});

  @override
  _AddCardProdukState createState() => _AddCardProdukState();
}

class _AddCardProdukState extends State<AddCardProduk> {

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data == null) {
      widget.data =
          Datum(barangId: '', namabarang: '', hargabarang: '', jumlahbarang: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Add Produk',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: widget.data?.namabarang ?? '',
                onChanged: (value) => widget.data?.namabarang = value,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    hintText: 'namabarang',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'namabarang tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                initialValue: widget.data?.hargabarang ?? '',
                onChanged: (value) => widget.data?.hargabarang = value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'hargabarang',

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'hargabarang tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.data?.jumlahbarang ?? '',
                onChanged: (value) => widget.data?.jumlahbarang = value,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'jumlahbarang',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'jumlahbarang tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              
              SizedBox(
                height: 20,
              ),
              Material(
                //Wrap with Material
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 18.0,
                color: Color(0xFF801E48),
                clipBehavior: Clip.antiAlias,
                // Add This
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 50,
                  // height: 35,
                  color: Color(0xFF801E48),
                  child: widget.title == null
                      ? Text('Update',
                          style:
                              new TextStyle(fontSize: 16.0, color: Colors.white))
                      : Text('${widget.title}',
                          style:
                              new TextStyle(fontSize: 16.0, color: Colors.white)),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      if (widget.title == null) {
                        widget.produkProvider!.updateData(
                            context, widget.data!);
                      } else {
                        widget.produkProvider!
                            .addData(context, widget.data!);
                      }
                    }
                    // else{
                    //     Fluttertoast.showToast(
                    //         msg: "This is Toast messaget",
                    //         toastLength: Toast.LENGTH_SHORT,
                    //         gravity: ToastGravity.CENTER,
                    //         // timeInSecForIos: 1
                      //  );                    }
                  //  }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
