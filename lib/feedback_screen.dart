import 'package:calculadora_tributaria/app_theme.dart';
import 'package:calculadora_tributaria/hotel_booking/slider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('lista'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Slidable(
                actions: <Widget>[
                  IconSlideAction(
                      icon: Icons.more,
                      caption: 'MORE',
                      color: Colors.blue,
                      //not defined closeOnTap so list will get closed when clicked
                      onTap: () {
                        print("More ${items[index]} is Clicked");
                      }
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                      icon: Icons.clear,
                      color: Colors.red,
                      caption: 'Cancel',
                      closeOnTap: false, //list will not close on tap
                      onTap: () {
                        print("More ${items[index]} is Clicked");
                      }
                  )
                ],
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text("${items[index]}"),
                  subtitle: Text("Slide left or right"),
                  trailing: Icon(Icons.arrow_back),
                ),
                actionPane: SlidableDrawerActionPane(),
              );


              // return Dismissible(
              //   // Each Dismissible must contain a Key. Keys allow Flutter to
              //   // uniquely identify widgets.
              //   key: Key(item),
              //   // Provide a function that tells the app
              //   // what to do after an item has been swiped away.
              //   onDismissed: (direction) {
              //     // Remove the item from the data source.
              //     setState(() {
              //       items.removeAt(index);
              //     });
              //
              //     // Then show a snackbar.
              //     ScaffoldMessenger.of(context)
              //         .showSnackBar(SnackBar(content: Text('$item dismissed')));
              //   },
              //   // Show a red background as the item is swiped away.
              //   background: Container(color: Colors.red),
              //   child: ListTile(title: Text('$item')),
              // );
            },
          ),

          // child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: items.length,
          //     itemBuilder: (context, index) {
          //       final item = items[index];
          //       return Slidable(
          //           actionPane: SlidableDrawerActionPane(),
          //           child: Container(
          //             child: ListTile(title: Text('t'),
          //             ),
          //           ));
          //     }
          // )



        )
    );
  }

}
