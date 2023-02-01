import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment_03/DirectoryModel.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:assignment_03/directory_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directory App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Directory App'),
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<DirectoryModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    DirectoryModel directoryModel = items[index];
                    return GestureDetector(
                      // elevation: 5,
                      // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                       onTap: (){
                         Navigator.push(context,
                         MaterialPageRoute(
                             builder: (context) =>  DirectoryDetailPage(directoryModel),
                         ));
                       },
                      child: Container(
                        padding: EdgeInsets.only(top:5, bottom: 5, left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              child: Image(image: NetworkImage(items[index].image.toString()),fit: BoxFit.fill,),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    child: Text(
                                      items[index].title.toString(),
                                      style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: EdgeInsets.only(left: 5,right: 5),child: Text("Price: " + items[index].price.toString() +" "+items[index].currency.toString(),style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }

  Future<List<DirectoryModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('json/directorylist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => DirectoryModel.fromJson(e)).toList();
  }
}