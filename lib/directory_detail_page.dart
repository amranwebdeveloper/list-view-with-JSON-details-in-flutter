import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment_03/DirectoryModel.dart';



class DirectoryDetailPage extends StatelessWidget{
  final DirectoryModel directoryModel;
  DirectoryDetailPage(this.directoryModel);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("${directoryModel.title}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // child: Center(
        //     child: SizedBox(
        //       child: Image(image: NetworkImage("${directoryModel.image}"),fit: BoxFit.fill,),
        //     ),
        //   ),
        // padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  child: Image(image: NetworkImage("${directoryModel.image}"),fit: BoxFit.fill,),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Text("${directoryModel.details}",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                ),),),
            Padding(padding: EdgeInsets.only(left: 5,right: 5),child: Text("Price: " + "${directoryModel.price}" +" "+"${directoryModel.currency}",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),)
          ],
        ),
      ),
    );
  }
}