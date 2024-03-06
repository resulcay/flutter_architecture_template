import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pureblog/blog.dart';
import 'package:pureblog/manager.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PureBlog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: 30,
        ),
        elevation: 1,
      ),
      body: FutureBuilder<List<Blog>>(
        future: Manager.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DateTime dateTime = DateTime.parse(
                    snapshot.data![index].blogCreatedAt.toString());

                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://pureblog.com.tr${snapshot.data![index].blogImage}',
                          width: 150,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          snapshot.data![index].blogTitle.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(snapshot.data![index].blogContent.toString()),
                        Text(
                          dateTime.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          snapshot.data![index].writer!.writerNameSurname
                              .toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(snapshot.data![index].writer!.writerUserName
                            .toString()),
                        const SizedBox(height: 5),
                        Text(snapshot.data![index].category!.categoryName
                            .toString()),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
