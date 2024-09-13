import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(icon: Icon(Icons.list_alt), text: 'To-Do'),
            Tab(icon: Icon(Icons.meeting_room), text: 'Meeting'),
            Tab(icon: Icon(Icons.lightbulb), text: 'Idea'),
            Tab(icon: Icon(Icons.space_bar), text: 'Blank'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TodoScreen(), // To-Do Screen
          Center(child: Text('Meeting Screen')),
          Center(child: Text('Idea Screen')),
          Center(child: Text('Blank Screen')),
        ],
      ),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Map<String, dynamic>> _todoList = [
    {'title': 'Start a to-do list', 'completed': true},
    {'title': 'Draft marketing campaign', 'completed': true},
    {'title': 'Follow up questions', 'completed': true},
  ];
  final List<Map<String, dynamic>> _todoList2 = [
    {'title': 'Call insurance broker', 'completed': false},
    {'title': 'Send credit application', 'completed': false},
    {'title': 'Go through old mail', 'completed': false},
  ];
  final List<Map<String, dynamic>> _todoList3 = [
    {'title': 'Email expense report', 'completed': false},
    {'title': 'Clean car before trip', 'completed': false},
    {'title': 'Pick up form', 'completed': false},
    {'title': 'Send deposit to cleaner', 'completed': false},
  ];
  final TextEditingController _todoController = TextEditingController();

  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todoList.add({
          'title': _todoController.text,
          'completed': false,
        });
      });
      _todoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: isTablet ? 24 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isTablet ? 20 : 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: _todoList[index]['completed'],
                        onChanged: (value) {
                          setState(() {
                            _todoList[index]['completed'] = value!;
                          });
                        },
                      ),
                      title: Text(
                        _todoList[index]['title'],
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 14,
                          decoration: _todoList[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Tomorrow',
                style: TextStyle(
                  fontSize: isTablet ? 24 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isTablet ? 20 : 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _todoList2.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: _todoList2[index]['completed'],
                        onChanged: (value) {
                          setState(() {
                            _todoList2[index]['completed'] = value!;
                          });
                        },
                      ),
                      title: Text(
                        _todoList2[index]['title'],
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 14,
                          decoration: _todoList2[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'This Week',
                style: TextStyle(
                  fontSize: isTablet ? 24 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isTablet ? 20 : 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _todoList3.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: _todoList3[index]['completed'],
                        onChanged: (value) {
                          setState(() {
                            _todoList3[index]['completed'] = value!;
                          });
                        },
                      ),
                      title: Text(
                        _todoList3[index]['title'],
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 14,
                          decoration: _todoList3[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
