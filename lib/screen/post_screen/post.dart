import 'package:flutter/material.dart';
import '../../api_service/api_service.dart';
import '../../model/post/post.dart';
import '../../widget/travel_card.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<Post>> futurePosts;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futurePosts = apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TravelCard(
                  width: width,
                  title: snapshot.data![index].title,
                  body: snapshot.data![index].body,
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Post newPost = Post(id: 0, title: 'New Post', body: 'This is a new post');
          await apiService.createPost(newPost);
          setState(() {
            futurePosts = apiService.fetchPosts();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
