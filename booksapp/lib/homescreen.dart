import 'dart:convert';

import 'package:booksapp/Model.dart';
import 'package:booksapp/expenses.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class homescreen extends StatefulWidget {

   homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final box=GetStorage();
  @override



  
Stream<Model> getinformation()async*{
    final response=await box.read('Response');
  

    var data =await jsonDecode(response.body.toString());
    yield Model.fromJson(data);
}
var search=TextEditingController();
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses List',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: search,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                hintText: 'Search Expenses'
              ),
              onChanged: (val){
                setState(() {

                });
              },
            ),
          ),
          Expanded(child: StreamBuilder<Model>(
            stream: getinformation(),
            builder: (context,snapshot){
              if(!snapshot.hasData)
                {
                  return const Center(child: CircularProgressIndicator());

                }

              else {
                return ListView.builder(
                    itemCount: snapshot.data!.expenseList!.length,
                    itemBuilder: (context, index) {
                      if(search.text.isEmpty) {

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape:  RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                            title: Text(
                                snapshot.data!.expenseList![index].expenseName
                                    .toString()),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>expenses(description:snapshot.data!.expenseList![index].description.toString() ,vendorname: snapshot.data!.expenseList![index].vendorName.toString(),notes: snapshot.data!.expenseList![index].notes.toString(),category: snapshot.data!.expenseList![index].category.toString(),cost:  snapshot.data!.expenseList![index].cost.toString(),internalkey: snapshot.data!.expenseList![index].internalKeyForKnownExpenses.toString(),serviceid: snapshot.data!.expenseList![index].serviceId.toString(),)));
                            },

                          ),
                        );
                      }
                      else if(snapshot.data!.expenseList![index].expenseName!.toLowerCase().contains(search.text.toString()))
                      {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                            title:Text(snapshot.data!.expenseList![index].expenseName!.toString()),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>expenses(description:snapshot.data!.expenseList![index].description.toString() ,vendorname: snapshot.data!.expenseList![index].vendorName.toString(),notes: snapshot.data!.expenseList![index].notes.toString(),category: snapshot.data!.expenseList![index].category.toString(),cost:  snapshot.data!.expenseList![index].cost.toString(),internalkey: snapshot.data!.expenseList![index].internalKeyForKnownExpenses.toString(),serviceid: snapshot.data!.expenseList![index].serviceId.toString(),)));
                            },
                          ),
                        );


                      }
                      else
                        {
                          return Container();
                        }
                    });
              }

            },
          ))
        ],),
      )


        );






  }
}
