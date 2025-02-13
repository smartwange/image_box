import 'package:flutter/material.dart';
import 'package:image_box/image_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> photoList = [
      'https://raw.githubusercontent.com/smartwange/image_box/refs/heads/main/example/assets/images/female_active.png',
      'https://raw.githubusercontent.com/smartwange/image_box/refs/heads/main/example/assets/images/male_active.png'
    ];

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                  spacing: 8,
                  children: photoList
                      .asMap()
                      .entries
                      .map((e) {
                        print(e.key);
                        return GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  width: size.width - 20,
                                  child: ImageBox(
                                    bgColor: Colors.white,
                                    imageIndex: e.key,
                                    imageList: photoList,
                                  ),
                                );
                              }),
                          child: Stack(
                            children: [
                              Image.network(e.value,
                                  height: 90,
                                  width: (size.width - 57) / 3,
                                  fit: BoxFit.fill),
                              Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: Image.asset(
                                      'assets/images/enlarge.png',
                                      width: 20,
                                      fit: BoxFit.fitWidth))
                            ],
                          ),
                        );
                      })
                      .toList()
                      .cast<Widget>())
            ],
          ),
        ));
  }
}
