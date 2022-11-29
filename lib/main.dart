import 'package:flutter/material.dart';
import 'remote_service.dart';
import 'currency.dart';
import 'currency_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super (key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int id;
  List<Currency>? currency;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }
  getData() async {
    currency = await RemoteService().getCurrency();
    if(currency != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Currency selection"),
        ),
       body: Center(
        child: Row(

        children: [
        Container(
        margin: EdgeInsets.fromLTRB(300, 0, 75, 0),
        child:
        ElevatedButton(
        onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Currency_page(id: 25)));
        },
        child: Text('USD'),
        style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
        ),


        ),),
        Container(
        margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
    ElevatedButton(
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Currency_page(id: 32)));
    },
    child: Text('Euro'),
    style: ElevatedButton.styleFrom(
    primary: Colors.black,
    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),),
    ),),
    Container(margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
    ElevatedButton(
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Currency_page(id: 58)));
    },
    child: Text('Gold'),
    style: ElevatedButton.styleFrom(
    primary: Colors.black,
    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),),
    ),),
    Container(margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
    ElevatedButton(
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Currency_page(id: 59)));
    },
    child: Text('Silver'),
    style: ElevatedButton.styleFrom(
    primary: Colors.black,
    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
    ),
    ))

    ],
    ),
    ),);}}

/*if(currency![index].txt == "Євро"){
                return Container(child:Row(
                    children:[ Text(currency![index].txt),
                ])
                );
              }


              Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          currency![index].txt ?? ' ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Text(" "),
                      Text(
                          currency![index].rate.toString() ?? ' ',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ],)
              );
            }}),
            replacement: const Center(
              child: CircularProgressIndicator(),),


25
32
58
59
60
              */