import 'package:apliaksi_cuaca/api/api.dart';
import 'package:apliaksi_cuaca/api/modelApi.dart';
import 'package:flutter/material.dart';
class KotaLain extends StatefulWidget {
  const KotaLain({Key? key}) : super(key: key);

  @override
  State<KotaLain> createState() => _KotaLainState();
}

class _KotaLainState extends State<KotaLain> {
  final RestApiCuacaWilayah cuaca = RestApiCuacaWilayah();
  List<CuacaWilayah> _cuaca = [];
  getData() async {
    _cuaca = await cuaca.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Aplikasi Cuaca"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              // child: Text("data"),
              color: Color.fromARGB(255, 164, 217, 224),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Surabaya",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(_cuaca[0].jamCuaca.substring(0, 11)),
                  Image(
                    image: NetworkImage(
                        'https://ibnux.github.io/BMKG-importer/icon/' +
                            _cuaca[0].kodeCuaca +
                            '.png'),
                  ),
                  Text(
                    DateTime.now().toString().substring(10, 16),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              color: Color.fromARGB(255, 164, 217, 224),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _cuaca.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 200,
                    child: Column(
                      children: [
                        Text(_cuaca[index].cuaca),
                        Text(_cuaca[index].tempC + ' Celius'),
                        Image(
                          image: NetworkImage(
                              'https://ibnux.github.io/BMKG-importer/icon/' +
                                  _cuaca[index].kodeCuaca +
                                  '.png'),
                        ),
                        Text(_cuaca[index].jamCuaca.substring(10, 16)),
                      ],
                    ),
                    color: Color.fromARGB(255, 122, 185, 194),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 10));
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Color.fromARGB(255, 164, 217, 224),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _cuaca.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 200,
                    // child: Text(_cuaca[index].cuaca),
                    // color: Colors.white,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 10));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
