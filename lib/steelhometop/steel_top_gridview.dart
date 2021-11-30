import 'package:flutter/material.dart';

/// @auter Created by tyy on 2021/11/29
/// desc   :
/// version:

class GridViewMenu extends StatelessWidget {
  final List<String> data;
  final List<String> icons;
  final Function(int index) onItemClick;
  final Color color;

  const GridViewMenu(
      {Key key,
      @required this.data,
      @required this.icons,
      @required this.onItemClick,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 0.9),
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            child:
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child:   Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center ,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        icons[index] ,
                      ),
                    ),
                    Text(
                      data[index],
                      style: TextStyle(fontSize: 13,color: Colors.black),
                    )
                  ],
                ),
              ),
            )
          ,
            onTap: () {
              onItemClick(index);
            },
          );
        });
  }
}
