import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/views/details.dart';
import 'package:fmayinnovatest/models/models.dart';

class EmployeeCard extends StatefulWidget {
  final Employee? employee;
  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(employee: widget.employee!),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 44,
                    child: Text(
                      widget.employee!.id.toString(),
                      style: innovatestH2White,
                    ),
                    backgroundColor: secondaryColor.withOpacity(0.8),
                  ),
                ),
                Container(
                  //width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.employee!.employeeName,
                    style: innovatestH4Black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$ ${widget.employee!.employeeSalary.toString()}",
                        style: innovatestH1Black,
                      ),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.employee!.employeeAge.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: widget.employee!.employeeAge > 25 &&
                                  widget.employee!.employeeAge < 35
                              ? successColor
                              : dangerColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
