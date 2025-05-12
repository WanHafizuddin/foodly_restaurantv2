import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploaderController extends GetxController {
  Rx<File?> imageOne = Rx<File?>(null);
  Rx<File?> imageTwo = Rx<File?>(null);
  Rx<File?> imageThree = Rx<File?>(null);
  Rx<File?> imageFour = Rx<File?>(null);

  RxString imageOneUrl = ''.obs;
  RxString imageTwoUrl = ''.obs;
  RxString imageThreeUrl = ''.obs;
  RxString imageFourUrl = ''.obs;

  final ImagePicker picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> pickImage(Rx<File?> imageFile) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      } else {
        Get.snackbar("Error", "No image selected");
      }
    } catch (e) {
      Get.snackbar("Error", "Image selection failed: $e");
    }
  }

  // Upload image to Firebase Storage
  Future<String> uploadImageToFirebase(File image, String path) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(path);
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception("Upload failed: $e");
    }
  }

  // Save image URL to Firestore
  Future<void> saveImageUrlToFirestore({
    required String documentId,
    required String fieldName,
    required String url,
  }) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('restaurants');
      await collectionRef.doc(documentId).set(
        {fieldName: url},
        SetOptions(merge: true),
      );
    } catch (e) {
      throw Exception("Firestore save failed: $e");
    }
  }

  // Upload all images and save URLs to Firestore
  Future<void> uploadAllImages(String documentId) async {
    try {
      if (imageOne.value != null) {
        final url1 = await uploadImageToFirebase(
          imageOne.value!,
          'restaurants/$documentId/image1.jpg',
        );
        imageOneUrl.value = url1;
        await saveImageUrlToFirestore(
          documentId: documentId,
          fieldName: 'imageOne',
          url: url1,
        );
      }

      if (imageTwo.value != null) {
        final url2 = await uploadImageToFirebase(
          imageTwo.value!,
          'restaurants/$documentId/image2.jpg',
        );
        imageTwoUrl.value = url2;
        await saveImageUrlToFirestore(
          documentId: documentId,
          fieldName: 'imageTwo',
          url: url2,
        );
      }

      if (imageThree.value != null) {
        final url3 = await uploadImageToFirebase(
          imageThree.value!,
          'restaurants/$documentId/image3.jpg',
        );
        imageThreeUrl.value = url3;
        await saveImageUrlToFirestore(
          documentId: documentId,
          fieldName: 'imageThree',
          url: url3,
        );
      }

      if (imageFour.value != null) {
        final url4 = await uploadImageToFirebase(
          imageFour.value!,
          'restaurants/$documentId/image4.jpg',
        );
        imageFourUrl.value = url4;
        await saveImageUrlToFirestore(
          documentId: documentId,
          fieldName: 'imageFour',
          url: url4,
        );
      }

      Get.snackbar("Success", "Images uploaded and saved to Firestore");
    } catch (e) {
      Get.snackbar("Error", "Image upload failed: $e");
    }
  }
}
