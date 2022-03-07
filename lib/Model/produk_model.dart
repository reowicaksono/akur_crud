import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// To parse this JSON data, do
//
//     final listProduk = listProdukFromJson(jsonString);

import 'dart:convert';

ListProduk listProdukFromJson(String str) => ListProduk.fromJson(json.decode(str));

String listProdukToJson(ListProduk data) => json.encode(data.toJson());

class ListProduk {
    ListProduk({
        required this.isSuccess,
        required this.message,
        required this.data,
    });

    bool isSuccess;
    String message;
    List<Datum> data;

    factory ListProduk.fromJson(Map<String, dynamic> json) => ListProduk(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.barangId,
        required this.namabarang,
        required this.hargabarang,
        required this.jumlahbarang,
    });

    String barangId;
    String namabarang;
    String hargabarang;
    String jumlahbarang;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        barangId: json["barang_id"],
        namabarang: json["namabarang"],
        hargabarang: json["hargabarang"],
        jumlahbarang: json["jumlahbarang"],
    );

    Map<String, dynamic> toJson() => {
        "barang_id": barangId,
        "namabarang": namabarang,
        "hargabarang": hargabarang,
        "jumlahbarang": jumlahbarang,
    };
}
