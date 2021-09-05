import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}
//comment 1 : for build my app with 2 add buttons i make my main widget as StatefulWidget at this time
//comment 2 :then move all atributes of user_transactions to this file
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  void _startaddNewTransaction(BuildContext ctx) {
//comment 6 : use showModalBottomSheet is a Widget with 2 arguments context and builder
//context argument: we get data from parent function like _startaddNewTransaction and pass it to context argument
//builder argument: its an anonymous function with unnecessary arguments for us will be created
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
         //comment 7 :GestureDetector it a widget that we use it when we need catched an our widget
        //like NewTransaction that when we tap on NewTransaction we dont want to hide that 
        //(this widget was used for older flutter version ,its set to default for this widget for current version) 
          return GestureDetector(
        //behavior  and onTap
        //onTap is an anonymous function !important
        //behavior it has an enum widget by HitTestBehavior.opaque
            onTap: (){},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'book', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'food', amount: 75.99, date: DateTime.now()),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        //comment 3 : for add an icon to AppBar we have to add actions and inside it we can define our widgets

        actions: [
          //comment 4 :  widget of AppBar icon is IconButton and has 2 atributes onPressed: resive our addHandller function
          //second atribute is icon that we choose our icon 
          IconButton(
              onPressed: () => _startaddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART'),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      //comment 5 : floatingActionButton its make an other button that is down of the screen
      //i use it for buttons that do same work
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startaddNewTransaction(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
