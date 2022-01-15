import 'package:flutter/material.dart';
import 'package:list_test/new_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              secondary: Colors.grey,
              primary: Colors.amber,
            ),
        errorColor: Colors.yellow[600],
        fontFamily: 'Georgia',
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> listItems = [];

  void _startAddNewListItem(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewListItem(_addNewTransaction),
        );
      },
    );
  }

  void _addNewTransaction(String item) {
    setState(() {
      listItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
      ),
      body: listItems.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Nothing To do here!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          listItems[index],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              listItems.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete,
                              color: Theme.of(context).errorColor),
                        )),
                  ),
                );
              },
              itemCount: listItems.length,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewListItem(context),
      ),
    );
  }
}
