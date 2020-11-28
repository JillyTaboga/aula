import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquemeuhorario/ui/bottomsheets/bottomsheet_custom.dart';

enum DialogType { Error, Alert, Success }

Future<T> showErrorDialog<T>({
  @required DialogType type,
  @required String message,
  Function onOk,
}) async {
  T value;
  Widget title;
  switch (type) {
    case DialogType.Error:
      title = Text(
        'Erro',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      );
      break;
    case DialogType.Alert:
      title = Text(
        'Atenção',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 20,
        ),
      );
      break;
    case DialogType.Success:
      title = Text(
        'Sucesso',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      );
  }
  await Get.bottomSheet(
    BottomSheetCustom(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            title,
            SizedBox(
              height: 15,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text('ok'.tr),
              onPressed: () {
                Get.back();
                if (onOk != null) {
                  onOk();
                }
              },
            ),
            SizedBox(
              height: 5,
            ),
          ],
        )
      ],
    ),
  ).then((result) {
    value = result;
  });
  return value;
}

showDeleteConfirmation({@required Function delete}) {
  Get.bottomSheet(
    BottomSheetCustom(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Atenção',
              textAlign: TextAlign.center,
              style: Get.textTheme.headline2
                  .copyWith(color: Get.theme.primaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Deseja realmente apagar esse item?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Sim'),
                  onPressed: () {
                    if (delete != null) {
                      delete();
                    }
                  },
                ),
                ElevatedButton(
                  child: Text('Não'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        )
      ],
    ),
  );
}
