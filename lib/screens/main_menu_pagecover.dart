import 'package:flutter/material.dart';

class MenuPageCover extends StatefulWidget {
  String title;
  bool needBack;
  bool needBottom;
  var needTop;
  var needBackground;
  var isHome;
  Widget body;

  MenuPageCover({@required this.title, @required this.needBack, @required this.needBottom, @required this.body,Key key,this.needTop,this.needBackground,this.isHome}): super(key: key);

  @override
  _MenuPageCoverState createState() => _MenuPageCoverState();
}

class _MenuPageCoverState extends State<MenuPageCover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isHome==null || !widget.isHome ?null:Colors.transparent,
      body: SafeArea(
          child: Container(
            decoration: widget.needBackground==null || widget.needBackground? const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/image/menu_cover_page.png"),fit: BoxFit.cover)
            ):null,
            child: Column(
              children: [
                widget.needTop==null || widget.needTop?Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 25, 10),
                  child: Row(
                    children: [
                      widget.needBack?SizedBox(
                        width: 40,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ):const SizedBox(width: 40),
                      Expanded(child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )),
                      GestureDetector(
                        onTap: ()async{

                        },
                        child: Row(
                          children: [
                            // SvgPicture.asset(
                            //   'assets/Iconly-Light-Notification.svg',
                            //   color: Colors.blueGrey,
                            //   height: 20,
                            // ),
                            // const SizedBox(width: 5,),
                            // _checkStatus()
                          ],
                        ),
                      ),
                    ],
                  ),
                ):const SizedBox(),
                Expanded(child: widget.body),
                widget.needBottom?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text( "Powered by Bellvantage (Pvt) Ltd.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ):const SizedBox()
              ],
            ),
          )
      ),
    );
  }
}
