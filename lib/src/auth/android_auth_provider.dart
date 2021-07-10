import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: 'The Chat Crew',
      options: FirebaseOptions(
          apiKey: "AIzaSyDOnvIiVEoa_xoaVknrYe_drn8jVF7BYzI",
          authDomain: "the-chat-app-652a1.firebaseapp.com",
          projectId: "the-chat-app-652a1",
          storageBucket: "the-chat-app-652a1.appspot.com",
          messagingSenderId: "228157429864",
          appId: "1:228157429864:android:2c1327b68762a6207bc3dd"
      ),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {}