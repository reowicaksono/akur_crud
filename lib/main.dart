import 'package:akur_crud/Providers/produk_provider.dart';
import 'package:akur_crud/Model/produk_model.dart';
import 'package:akur_crud/Widgets/card_add_produk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //  // primarySwatch: Color,
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final listKey = GlobalKey<AnimatedListState>();
  //
  // final List<Datum> items = List.from(listMa);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProdukProvider(),)
      ],
      child: Consumer<ProdukProvider>(builder: (context,prdprovider,_){
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'CRUD Provider',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: prdprovider.isLoading ? Center(
            child: CircularProgressIndicator(color: Colors.blue,
            
            ),
          ) : ListView.builder(
                  itemCount: prdprovider.listProduk.length,
                  itemBuilder: (context, index) {
                    Datum data = prdprovider.listProduk[index];

                    return InkWell(
                      onTap: () async {
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddCardProduk(
                                      // title: 'Update',
                                      produkProvider: prdprovider,
                                      data: data,
                                    )));
                        if (result != null) {
                          prdprovider.rebuildData();
                        }
                      },
                      child: Card(
                        shadowColor: Colors.black,
                        child: ListTile(
                          title: Text(
                            '${data.namabarang}',
                          //  'Nama',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${data.jumlahbarang} |  Rp.${data.hargabarang}',
                            // 'Nim',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing:  InkWell(
                                onTap: () {
                                    // prdprovider.deleteData(index, data);
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Icon(
                                    Icons.delete,
                                    color: Color(0xFF801E48),
                                  ),
                                ),
                              )),
                        ),

                    );
                  })),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FloatingActionButton(
            backgroundColor: Color(0xFF801E48),
            foregroundColor: Colors.white,
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddCardProduk(
                            title: 'Add',
                            produkProvider: prdprovider,
                            // data: ,
                          )));
              if (result != null) {
                prdprovider.rebuildData();
              }
    
              // Respond to button press
            },
            child: Icon(Icons.add),
          ),
        ),
      );
      })
    );
  }
}
