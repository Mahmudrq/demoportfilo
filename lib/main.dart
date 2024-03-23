import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  double _imageSize = 50.0;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after the widget has been built
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _imageSize = 150.0; // Adjust the final size as needed
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A Cat's Portfolio"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: _imageSize,
              width: _imageSize,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://placekitten.com/200/200'), // Replace with your profile picture URL
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tommoy',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'About Me:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Fresh CSE Graduate From XXXX University. A passionate Flutter developer with a love for clean and efficient code. I enjoy creating mobile applications that provide a delightful user experience.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Skills:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Firebase')),
                Chip(label: Text('Java')),
                Chip(label: Text('UI/UX Design')),
                Chip(label: Text('SQA  Engineer')),
                Chip(label: Text('Database')),
                Chip(label: Text('Algothriom & Datastrcture')),
                Chip(label: Text('Ciso Routing')),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the button, e.g., navigating to a projects page
              },
              child: Text('View My Projects'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Projects:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // GridView to display project images
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 4, // Replace with the actual number of projects
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  'https://placekitten.com/300/300', // Replace with your project image URLs
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
