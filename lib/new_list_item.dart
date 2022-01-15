import 'package:flutter/material.dart';

class NewListItem extends StatefulWidget {
  final Function addItem;

  NewListItem(this.addItem);

  @override
  _NewListItemState createState() => _NewListItemState();
}

class _NewListItemState extends State<NewListItem> {
  final _textController = TextEditingController();
  void _submitData() {
    if (_textController.text.isEmpty) return;
    widget.addItem(_textController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'To do',
              ),
              autofocus: true,
              controller: _textController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: ElevatedButton(
                onPressed: _submitData,
                child: const Text(
                  'ADD NEW ITEM',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
