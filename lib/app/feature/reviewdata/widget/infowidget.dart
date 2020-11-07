import 'package:flutter/cupertino.dart';
import 'package:registration_form/app/constants/app_colors.dart';

class InformationWidget extends StatelessWidget {
  final String title;
  final String description;

  const InformationWidget({Key key, this.title: "", this.description: ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: Text(
              description,
              style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
