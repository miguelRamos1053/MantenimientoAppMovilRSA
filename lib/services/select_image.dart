import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker(); //Se hace una instancia del paquete
  final XFile? image = await picker.pickImage(
      source: ImageSource.gallery); //Permite seleccionar foto de la galería
  return image;
}
