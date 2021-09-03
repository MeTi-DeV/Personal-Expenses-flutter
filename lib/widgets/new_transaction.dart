import 'package:flutter/material.dart';

class New_Transaction extends StatelessWidget {
  // String titleInput = '';
  // String amountInput = '';
  //*****   use TextEditingController its make more safety  variable as String variables *****/
  final titleConroller = TextEditingController();
  final amountConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: amountConroller
// * comment line 50 till 52 because I use TextEditingController() class for Title

              // onChanged: (value) {
              //   titleInput = value;
              // },

              ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: titleConroller,

// * comment line 61 till 63 because I use TextEditingController() class for Amount

            // onChanged: (value) {
            //   amountInput = value;
            // },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: FlatButton(
              textColor: Colors.purple,
              onPressed: () {
                print(amountConroller.text);
                print(titleConroller.text);
              },
              child: Text('Add Amount'),
            ),
          )
        ],
      ),
    );
  }
}
