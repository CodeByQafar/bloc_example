import 'package:flutter/material.dart';

class PasswordValidationFiled extends StatelessWidget {
  const PasswordValidationFiled({super.key,required this.isConditionValidated,required this.conditionText});
final bool isConditionValidated;
final String conditionText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23,right: 10, top: 4,bottom:4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          
          Icon(
            isConditionValidated ? Icons.check : Icons.cancel,
            color: isConditionValidated
                ? Theme.of(context).colorScheme.onTertiary
                : Theme.of(context).colorScheme.error,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.84,
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 500),
                maxLines: 2,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: isConditionValidated
                      ? Theme.of(context).colorScheme.onTertiary
                      : Theme.of(context).colorScheme.error,
                ),
              child: Text(  conditionText
,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}