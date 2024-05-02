import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitusRecommendationPage extends StatefulWidget {
  @override
  _SitusRecommendationPageState createState() => _SitusRecommendationPageState();
}

class _SitusRecommendationPageState extends State<SitusRecommendationPage> {
  List<Map<String, dynamic>> recommendations = [
    {
      'name': 'Google',
      'image': 'assets/images/logo-ggl.png',
      'link': 'https://www.google.com',
      'isFavorite': false,
    },
    {
      'name': 'YouTube',
      'image': 'assets/images/logo-twt.png',
      'link': 'https://www.youtube.com',
      'isFavorite': false,
    },
    // Tambahkan rekomendasi situs lainnya di sini
  ];

  void toggleFavorite(int index) {
    setState(() {
      recommendations[index]['isFavorite'] =
      !recommendations[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Situs Rekomendasi'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              recommendations[index]['image'],
              width: 50,
              height: 50,
            ),
            title: Text(recommendations[index]['name']),
            subtitle: Text(recommendations[index]['link']),
            onTap: () {
              // Buka link saat item diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebsiteDetailPage(
                    url: recommendations[index]['link'],
                  ),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(
                recommendations[index]['isFavorite']
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: recommendations[index]['isFavorite']
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: () {
                // Toggle fitur favorit saat tombol ditekan
                toggleFavorite(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class WebsiteDetailPage extends StatelessWidget {
  final String url;

  WebsiteDetailPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Website Detail'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          // Gunakan try-catch untuk menangkap kesalahan
          try {
            webViewController.loadUrl(url);
          } catch (e) {
            print("Error loading URL: $e");
          }
        },
      ),
    );
  }
}