import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/views/employeecard.dart';
import 'package:fmayinnovatest/models/models.dart';
import 'package:fmayinnovatest/controllers/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Employee>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Employees List",
          style: innovatestH2White,
        ),
        backgroundColor: primaryColor.withOpacity(0.5),
        leading: const CircleAvatar(
          radius: 18,
          backgroundColor: secondaryColor,
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage("https://picsum.photos/180"),
          ),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: FutureBuilder<List<Employee>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Employee>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EmployeeCard(
                        employee: data![index],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator(
                color: secondaryColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
