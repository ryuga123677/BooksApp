import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class expenses extends StatefulWidget {
  String description,vendorname,notes,cost,category,internalkey,serviceid;
  expenses({super.key,required this.description,required this.vendorname,required this.notes,required this.cost,required this.category, required this.internalkey,required this.serviceid});

  @override
  State<expenses> createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Information',style: TextStyle(color: Colors.blue),),backgroundColor: Colors.blue.shade100,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [row(name: 'Description', value: widget.description),
              row(name: 'VendorName', value: widget.vendorname),
              row(name: 'Notes', value: widget.notes),
              row(name: 'Cost', value: widget.cost),
              row(name: 'Category', value: widget.category),
              row(name: 'InternalKeyforKnownExpenses', value: widget.internalkey),
              row(name: 'ServiceID', value: widget.serviceid),

            ],
          ),
        ),
      ),
    );
  }
}
class row extends StatelessWidget {
  String name,value;
   row({super.key,required this.name,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(name,style: TextStyle(fontSize: 18),),
      Text(" : ",style: TextStyle(fontSize: 18),),
      Text(value,style: TextStyle(color: Colors.blue,fontSize: 18),)],
    );
  }
}

