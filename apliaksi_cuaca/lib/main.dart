import 'package:apliaksi_cuaca/api/api.dart';
import 'package:apliaksi_cuaca/api/modelApi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              color: Color.fromARGB(255, 75, 168, 255),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Surabaya",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(_cuaca[0].jamCuaca.substring(0, 11)),
                  Text(
                    _cuaca[0].cuaca,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
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
            const Text(
              "Perkiraan Cuaca Hari ini",
              style: TextStyle(fontSize: 15),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color.fromARGB(255, 139, 195, 248),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _cuaca.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
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
                    color: Color.fromARGB(255, 139, 195, 248),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 8));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
