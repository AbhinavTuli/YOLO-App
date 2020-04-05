import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String uId;
final databaseReference = Firestore.instance;

Future<int> createUser(String e, String n) async{
  final QuerySnapshot result = await databaseReference
      .collection('users')
      .where('Email', isEqualTo: e)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;

  if (documents.length >= 1){
    uId=documents[0].documentID;
    return 1;
  }
  else {
    final docRef =await databaseReference.collection('users').add({
      'Email': e,
      'Name': n,
      'Karma': 0,
      'Level':0,
      'Nick':n,
    }
    );
    uId=docRef.documentID;
  }
  return 0;

}
Future<int> signInWithGoogle() async {


  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user =
      (await _auth.signInWithCredential(credential)).user;

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  int p=await createUser(email,name);
// Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  return p;
//  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}