import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custwitter/models/posts.dart';

class PostService
{
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
          id:        doc.id,
          creator:   doc.data()['creator'] ?? "",
          text:      doc.data()['text'] ?? "",
          timestamp: doc.data()['timestamp'] ?? 0);
    }).toList();
  }

  Future savePost(text, id) async {
    await FirebaseFirestore.instance.collection("posts").add({
      'text': text,
      'creator': id,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Stream<List<PostModel>> getPostByUser(uid){
    return FirebaseFirestore.instance.collection("posts")
        .where('creator', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }

}