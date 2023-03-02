import 'package:flutter/material.dart';
import '../../../../App/index.dart';
import '../../../sorah/Presentation/Pages/surah_builder.dart';
import 'Components/mydrawer.dart';
import 'Widgets/arabic_sura_number.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        backgroundColor: Colors.green,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SurahBuilder(
                  arabic: quran[0],
                  sura: bookmarkedSura - 1,
                  suraName: arabicName[bookmarkedSura - 1]['name'],
                  ayah: bookmarkedAyah,
                ),
              ),
            );
          }
        },
        child: const Icon(Icons.bookmark),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "القرآن",
          // "Quran",
          style: TextStyle(
            fontFamily: FontsName.quran,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 56, 115, 59),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 221, 250, 236),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 130, 130, 130),
                          )
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                        arabic: quran[0],
                        sura: i,
                        suraName: arabicName[i]['name'],
                        ayah: 0,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}