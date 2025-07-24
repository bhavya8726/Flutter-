import 'package:flutter/material.dart';
void main()
{
  runApp(image());
}
class image extends StatelessWidget {
  const image({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Column(
          children: [
          Expanded(child: Stack(
            alignment: Alignment.center,
          children: [
            Container(
                child: Image.network("https://tse3.mm.bing.net/th/id/OIP.FEqv7YYMNjXtrVYqo7HHzAHaE7?rs=1&pid=ImgDetMain&o=7&rm=3",fit: BoxFit.cover,),
              height: double.infinity,
              width: double.infinity,
            ),
            // Container(
            //   height: 180,
            //   child: Row(
            //     children: [
            //       Expanded(child: Image.network("https://yt3.ggpht.com/a/AATXAJxMmH4crtoO6888dSZsdj8hhbnNiaxGQ15WEg=s900-c-k-c0xffffffff-no-rj-mo")),
            //     ],
            //   ),
            // ),

            Container(
                color: Colors.grey.withAlpha(180),
              ),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Image.network("https://tse2.mm.bing.net/th/id/OIP.5zPz6tTEilBeGMALSLGPsQAAAA?rs=1&pid=ImgDetMain&o=7&rm=3"),
              SizedBox(
                height: 20,
              ),
                Container(
                    padding:EdgeInsets.all(8),
                    child: Text("Darshan university",style: TextStyle(color: Colors.white),))
              ],
            )

          ],))
          ],
        ),
      )
    );
  }
}
