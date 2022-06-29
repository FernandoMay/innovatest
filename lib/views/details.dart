import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/models/models.dart';

class Details extends StatefulWidget {
  final Employee? employee;
  const Details({Key? key, this.employee}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.employee!.employeeName,
          style: innovatestH2White,
        ),
        backgroundColor: primaryColor.withOpacity(0.5),
        previousPageTitle: "Employees List",
        // leading: Drawer(),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 44.0),
                child: CircleAvatar(
                  child: widget.employee!.profileImage != ""
                      ? CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              NetworkImage(widget.employee!.profileImage),
                        )
                      : Text(
                          widget.employee!.id.toString(),
                          style: innovatestH4White,
                        ),
                  backgroundColor: secondaryColor.withOpacity(0.7),
                  radius: 88,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.employee!.employeeName,
                      style: innovatestH3Black,
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.employee!.employeeAge.toString(),
                      style: innovatestH3Black,
                    ),
                  ),
                ],
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "\$ ${widget.employee!.employeeSalary.toString()}",
                  //maxLines: 3,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                    color: widget.employee!.employeeSalary > 100000
                        ? successColor
                        : dangerColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: secondaryColor,
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
