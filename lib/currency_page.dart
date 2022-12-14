import 'package:flutter/material.dart';
import 'currency.dart';
import 'remote_service.dart';

class Currency_page extends StatefulWidget {
  late int id;
  Currency_page({super.key,required this.id});
  @override
  _Currency_page createState() =>  _Currency_page(id: id);
}


class _Currency_page extends State<Currency_page> {
  late int id;
  _Currency_page({required this.id});
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Currency"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return  Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          currency![id].txt,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ), Text(" "),
                      Text(
                          currency?[id].rate.toString() ??'',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Text(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          " ??????"
                      ),
                    ],)
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),),

      ),
    );
  }
}