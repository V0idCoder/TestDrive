import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/categories_provider.dart';
import '../widgets/category_item.dart';

class HomePage extends StatefulWidget {
  //Set the route name
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInit = false;
  bool _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (!_isInit) {
      _isLoading = true;
      await Provider.of<CategoryProvider>(context).fetchAndSetCategories();
      setState(() {
        _isLoading = false;
      });
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/img/home/testdrive_logo.png',
            fit: BoxFit.cover),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryItem(
            idCategory: categories[index].idCategory,
            strCategory: categories[index].strCategory,
            linkCategory: categories[index].linkCategory,
            screen: categories[index].screen,
          ),
        ),
      ),
    );
  }
}
