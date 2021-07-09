import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

pdfDeleteBox(BuildContext context, collection, fileId, deviceSize) {
  return showDialog(
      barrierColor: Color(0xff000000).withOpacity(0.8),
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: Color(0xffffffff).withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: Center(
            child: Text(
              'Silmek istediğine emin misin? ',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600),
            ),
          ),
          actions: [
            Container(
              height: 50,
              width: 70,
              margin:
                  EdgeInsets.symmetric(horizontal: (deviceSize.width / 2) - 70),
              child: IconButton(
                  iconSize: 24.0,
                  padding: EdgeInsets.all(12),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.withOpacity(0.6),
                  ),
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection(collection)
                        .doc(fileId)
                        .delete();
                    Navigator.pop(context);
                  }),
            )
          ],
        );
      });
}
