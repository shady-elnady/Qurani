import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../App/index.dart';
import '../../../../Views/Widgets/arabic_sura_number.dart';
import '../../../../Views/Widgets/error_widget.dart';
import '../../Domain/Entities/sora.dart';
import '../Bloc/Index/index_bloc.dart';
import 'Components/quran_drawer.dart';

class QuranIndexScreen extends StatefulWidget {
  const QuranIndexScreen({Key? key}) : super(key: key);

  @override
  State<QuranIndexScreen> createState() => _QuranIndexScreenState();
}

class _QuranIndexScreenState extends State<QuranIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const QuranDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        backgroundColor: Colors.green,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SurahBuilder(
            //       arabic: quran[0],
            //       sura: bookmarkedSura - 1,
            //       suraName: arabicName[bookmarkedSura - 1]['name'],
            //       ayah: bookmarkedAyah,
            //     ),
            //   ),
            // );
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
            // fontFamily: FontsName.quran,
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
      body: BlocBuilder<IndexBloc, IndexState>(
        // buildWhen: (previous, current) =>
        //     previous.DepartmentState != current.DepartmentState,
        builder: (context, state) {
          if (state is LoadingIndexState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedIndexState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<IndexBloc>(context).add(RefreshIndexEvent()),
              child: indexCreator(
                  quranSouarList: state.souarList, context: context),
            );
          } else if (state is ErrorIndexState) {
            return ErrorConnection(message: state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Container indexCreator({
    required List<Sora> quranSouarList,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 221, 250, 236),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          color: index % 2 == 0
              ? const Color.fromARGB(255, 253, 247, 230)
              : const Color.fromARGB(255, 253, 251, 240),
          child: TextButton(
            child: Row(
              children: [
                ArabicSuraNumber(i: index),
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
                  quranSouarList[index].native,
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SurahBuilder(
              //       arabic: quran[0],
              //       sura: i,
              //       suraName: arabicName[i]['name'],
              //       ayah: 0,
              //     ),
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
