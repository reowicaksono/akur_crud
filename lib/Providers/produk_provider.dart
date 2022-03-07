import 'package:akur_crud/Controller/produk_controller.dart';
import 'package:akur_crud/Model/produk_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

class ProdukProvider extends ChangeNotifier {
  List<Datum> listProduk = [];
  bool isLoading = true;

  ProdukProvider() {
    this.getData();
  }
  void getData() async {
    isLoading = true;
    notifyListeners();
    produkController.getProduk().then((value) {
      isLoading = false;
      if (value != null) {
        listProduk = value;
        print(listProduk);
      }
      notifyListeners();
    });
  }

  void addData(context, Datum produk) async {
    produkController.addProduk(produk).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
      }
      {
        Fluttertoast.showToast(
          msg: 'Data tidak boleh kosong',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black12,
          textColor: Colors.white,
          fontSize: 16
        );
      }
    });
  }
  void updateData(context, Datum produk) async {
    produkController.updateProduk(produk).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
      }
      {
        Fluttertoast.showToast(
          msg: 'Data tidak boleh kosong',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black12,
          textColor: Colors.white,
          fontSize: 16
        );
      }
    });
  }
    void rebuildData() async {
    listProduk = [];
    notifyListeners();
    getData();
  }

}
