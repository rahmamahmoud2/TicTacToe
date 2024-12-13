import 'package:flutter/material.dart';

class theGame extends StatelessWidget {
  const theGame({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> xo = [
      Image.asset(
        'assets/images/o1.png',
      ),
      Image.asset('assets/images/x.png'),
      Text(''),
      Image.asset(
        'assets/images/x.png',
      ),
      Image.asset('assets/images/o1.png'),
      Image.asset('assets/images/x.png'),
      Image.asset('assets/images/o1.png'),
      Text(''),
      Image.asset('assets/images/o1.png'),
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/download12.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Center(
              child: Text(
                "TIC TAC TOE ",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'fonto'),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Container(
                padding: EdgeInsets.only(right: 20),
                width: width * 0.75,
                height: height * 0.45,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  children: List.generate(9, (index) {
                    return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 119, 215, 59),
                                  blurRadius: 3,
                                  offset: Offset(5, 9))
                            ],
                            color: const Color.fromARGB(255, 38, 37, 37),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(child: xo[index]));
                  }),
                )),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'playing');
                },
                child: Image.asset(
                  'assets/images/button.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
