import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class user_api extends StatelessWidget {
  const user_api({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 211, 243),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person,
                      size: 60, color: Color.fromARGB(255, 32, 1, 37)),
                  Text("name : ${temp['name']}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text("username : ${temp['username']}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text("email : ${temp['email']}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text('phone : ${temp['phone']}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text('street : ${temp['address']['street']}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text('city : ${temp['address']['city']}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                  Text("lat : ${temp['address']['geo']['lat']}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 1, 37),
                        fontSize: 25,
                      )),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 127, 16, 147),
              ),
            );
          }
        },
      ),
    );
  }
}

getData() async {
  Dio userapi = Dio();
  Response response =
      await userapi.get('http://jsonplaceholder.typicode.com/users/1');
  print(response.data);
  return response.data;
}
