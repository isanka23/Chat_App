import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repo.dart';
import 'package:flutter/material.dart';

class NetworkImagePickerBody extends StatelessWidget {
  NetworkImagePickerBody({
    super.key,
  });

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelFordImage>>(
      future: _imageRepo.getNetworkImage(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PixelFordImage>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while the images are being fetched
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Display an error message if the future fails
          return const Center(child: Text('Failed to load images'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // If the images are fetched successfully, display them in a grid
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
            ),
            itemBuilder: (context, index) {
              return Image.network(
                snapshot.data![index].urlSmallSize,
                fit: BoxFit.cover, // Fit image inside the grid cell
              );
            },
          );
        } else {
          // Handle the case where no images are available
          return const Center(child: Text('No images found'));
        }
      },
    );
  }
}
