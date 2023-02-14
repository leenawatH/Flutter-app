import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<List<dynamic>>? csvData;

  Future<List<List<dynamic>>> processCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/Sec_1_Student.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Student"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: csvData == null
            ? const CircularProgressIndicator()
            : DataTable(
                columns: csvData![0]
                    .map(
                      (item) => DataColumn(
                        label: Text(
                          item.toString(),
                        ),
                      ),
                    )
                    .toList(),
                rows: csvData!
                    .skip(1)
                    .map(
                      (csvrow) => DataRow(
                        cells: csvrow
                            .map(
                              (csvItem) => DataCell(
                                Text(
                                  csvItem.toString(),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          csvData = await processCsv();
          setState(() {});
        },
      ),
    );
  }
}
