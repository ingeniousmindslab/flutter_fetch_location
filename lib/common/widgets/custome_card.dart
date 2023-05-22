import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.rediusSpread,
      this.height,
      this.width,
      this.redius})
      : super(key: key);
  final String title;

  final String subTitle;
  final double? height;
  final double? width;
  final double? redius;
  final double? rediusSpread;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: Text(
              subTitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(redius ?? 5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromRGBO(230, 230, 230, 0.9),
            blurRadius: rediusSpread ?? redius ?? 5,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      padding: const EdgeInsets.all(15.0),
      height: height ?? 50,
      width: Get.width,
    );
  }
}

class CustomCoumnCard extends StatelessWidget {
  const CustomCoumnCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.rediusSpread,
      this.height,
      this.width,
      this.redius})
      : super(key: key);
  final String title;

  final String subTitle;
  final double? height;
  final double? width;
  final double? redius;
  final double? rediusSpread;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                visible: subTitle.toLowerCase() == "not avaliable",
                child: const SizedBox(
                  child: Text(
                    "Not Avaliable",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            maintainSize: false,
            visible: subTitle.toLowerCase() == "not avaliable" ? false : true,
            child: const SizedBox(
              height: 10,
            ),
          ),
          Visibility(
            maintainSize: false,
            visible: subTitle.toLowerCase() == "not avaliable" ? false : true,
            child: SizedBox(
              child: Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(redius ?? 5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromRGBO(230, 230, 230, 0.9),
            blurRadius: rediusSpread ?? redius ?? 5,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      padding: const EdgeInsets.all(15.0),
      height: height,
      width: Get.width,
    );
  }
}
