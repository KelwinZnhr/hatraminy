import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatraminy/models/until.dart';
import 'package:hatraminy/models/until_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UntilDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => UntilDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: Colors.pink),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

String colorCode = '0';

List dataColo = [Colors.red, Colors.green, Colors.blue];
DateTime selectedDate = DateTime.now();
String nameEvent = "";
Color selectedColor = Colors.blue;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final eventController = TextEditingController();
  void readUntil() {
    context.read<UntilDatabase>().fetchUntils();
  }

  void deleteUntil(int id) {
    context.read<UntilDatabase>().deleteUntil(id);
  }

  @override
  void initState() {
    super.initState();

    //?fetching existing untils
    readUntil();
  }

  @override
  Widget build(BuildContext context) {
    final untileDatabase = context.watch<UntilDatabase>();
    List<Until> currentUntils = untileDatabase.currentUntils;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Hatraminy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month_rounded, color: Colors.pink),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                          currentUntils.length + 1,
                          (index) {
                            if (index < currentUntils.length &&
                                currentUntils.isNotEmpty) {
                              return GestureDetector(
                                onLongPress: () =>
                                    deleteUntil(currentUntils[index].id),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: forDisplay(currentUntils[index]),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    //backgroundColor: Colors.black,
                                    showDragHandle: true,
                                    enableDrag: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BottomSheet(onClosing: () {
                                        setState(() {});
                                      }, builder: (BuildContext context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context, setState) {
                                          return FractionallySizedBox(
                                            heightFactor: 0.95,
                                            child: Container(
                                              //height: MediaQuery.of(context).size.height,
                                              color: Colors.black,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      UntilDatabase>()
                                                                  .addUntil(
                                                                      nameEvent,
                                                                      selectedDate,
                                                                      colorCode,
                                                                      false);
                                                              currentUntils.add(
                                                                  Until(
                                                                      nameEvent,
                                                                      selectedDate,
                                                                      colorCode,
                                                                      false));
                                                              setState(() {
                                                                selectedDate =
                                                                    DateTime
                                                                        .now();
                                                                selectedColor =
                                                                    Colors
                                                                        .green;
                                                                nameEvent = "";
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Save'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Center(
                                                        child: forDisplay(Until(
                                                            nameEvent,
                                                            selectedDate,
                                                            colorCode,
                                                            false)),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child: Text(
                                                        'Details',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            prefixIcon: Icon(Icons
                                                                .format_align_left_rounded),
                                                            hintText:
                                                                'Event name',
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .amber,
                                                                      width: 4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          controller:
                                                              eventController,
                                                          onChanged: (value) {
                                                            nameEvent = value;
                                                            setState(() {});
                                                          },
                                                          onSubmitted: (value) {
                                                            setState(() {
                                                              nameEvent = value;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: TextField(
                                                        readOnly: true,
                                                        onTap: () async {
                                                          selectedDate =
                                                              (await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  firstDate:
                                                                      DateTime
                                                                          .now(),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2026)))!;
                                                          if (selectedDate !=
                                                              null) {
                                                            setState(() {
                                                              selectedDate =
                                                                  selectedDate;
                                                            });
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          prefixIcon: Icon(Icons
                                                              .date_range_rounded),
                                                          hintText:
                                                              '${getMonth(selectedDate.month)} ${selectedDate.day}, ${selectedDate.year}',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .amber,
                                                                    width: 4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 150,
                                                        child: GridView.count(
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            crossAxisCount: 3,
                                                            children:
                                                                List.generate(
                                                                    dataColo
                                                                        .length,
                                                                    (index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        20.0),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      selectedColor =
                                                                          dataColo[
                                                                              index];
                                                                      colorCode =
                                                                          index
                                                                              .toString();
                                                                    });
                                                                  },
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(30),
                                                                      child: Container(
                                                                        height:
                                                                            5,
                                                                        width:
                                                                            5,
                                                                        color: dataColo[
                                                                            index],
                                                                      )),
                                                                ),
                                                              );
                                                              ;
                                                            }))),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                                  context)
                                                              .viewInsets
                                                              .bottom),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    border: Border.all(),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  width: MediaQuery.of(context).size.width / 2 -
                                      25,
                                  height:
                                      MediaQuery.of(context).size.width / 2 -
                                          25,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                            Icons.add_circle_outline_rounded,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          "Add Event ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  int daysBetween(
    DateTime from,
    DateTime to,
  ) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (from.difference(to).inHours / 24).round();
  }

  String getMonth(int monthInt) {
    List<String> month = [
      "JAN",
      "FEV",
      "MAR",
      "APR",
      "MAI",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    return month[monthInt - 1];
  }

  Color getColor(String couleurCode) {
    switch (couleurCode) {
      case '0':
        return dataColo[0];
      case '1':
        return dataColo[1];
      case '2':
        return dataColo[2];
    }
    return Colors.green;
  }

  Widget forDisplay(Until until) {
    var deadline = until.date;
    var date2 = DateTime.now();
    var difference = daysBetween(deadline, date2);
    return Container(
      decoration: BoxDecoration(
        color: getColor(until.couleur),
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width / 2 - 25,
      height: MediaQuery.of(context).size.width / 2 - 25,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$difference days",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  until.event,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${getMonth(deadline.month)} ${deadline.day}"),
                SizedBox(
                  height: 05,
                ),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: Colors.black12,
                  color: Colors.white,
                  minHeight: 10,
                  value: difference / 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
