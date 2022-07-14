
import 'package:flutter/material.dart';
import 'details_list.dart';

class DetailsScreen extends StatefulWidget {
  final String book;
  const DetailsScreen(this.book);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var controller = IndexedScrollController();
    return SafeArea(
        child: Scaffold(
          body:Container(
            //color: Colors.black54,
            color: Colors.teal,
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                 DetailsList(bName: widget.book)
                // FutureBuilder(
                //     future:snapvalue(widget.book),
                //     builder: (context,snapshot){
                //   if(snapshot.connectionState==ConnectionState.waiting)
                //     {return CircularProgressIndicator();
                //     }else return IndexedListView.builder(
                //       controller: controller,
                //       itemBuilder: (context,index){
                //       return DetailsList();
                //   });
                // })
              ],
            ),
          ) ,

    )
    );
  }
}
