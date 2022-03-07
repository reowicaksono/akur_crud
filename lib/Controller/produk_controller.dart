import 'package:akur_crud/Model/produk_model.dart';
import 'package:http/http.dart' as http;

class ProdukController {

  final String baseUrl = "http://192.168.56.1/restApiAkur/";

  Future getProduk() async{
    try{
      final response = await http.get(Uri.parse(baseUrl+ 'getProduk.php'));
      //Jika ada data
      if(listProdukFromJson(response.body).isSuccess == true){
        //Kembalikan data ke dalam bentuk Json
        return listProdukFromJson(response.body).data;
      }else{
        return null;
      }
    }catch(e){
      return e.toString();
    }
  }

  //Add Method
  Future addProduk(Datum produk) async{
    try{
      final response = await http.post(Uri.parse(baseUrl+ 'addProduk.php'), body: {
        'namabarang' : produk.namabarang,
        'jumlahbarang' : produk.jumlahbarang,
        'hargabarang' : produk.hargabarang
      });

      if(listProdukFromJson(response.body).isSuccess == true){
        return listProdukFromJson(response.body);
      }
    }catch(e){
      return e.toString();
    }
  }
  //Update Method
  Future updateProduk(Datum produk) async{
    try{
      final response = await http.post(Uri.parse(baseUrl+ 'editProduk.php'), body: {
        'namabarang' : produk.namabarang,
        'jumlahbarang' : produk.jumlahbarang,
        'hargabarang' : produk.hargabarang,
        'barangId' : produk.barangId
      });

      if(listProdukFromJson(response.body).isSuccess == true){
        return listProdukFromJson(response.body);
      }
    }catch(e){
      return e.toString();
    }
  }
}


  
final produkController = ProdukController();