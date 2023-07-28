class Validators {
  String validateAndConvertToHttps(String url) {
    if (url.endsWith("image_not_available.jpg")) {
      return "https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/d8/f5/37/d8f53781-3dcd-90b2-63e8-79f23e0dc391/cover.jpg/1200x1200bb.jpg";
    }
    if (url.startsWith("http://")) {
      // Reemplazar "http://" con "https://"
      String updatedUrl = url.replaceFirst("http://", "https://");
      return updatedUrl;
    }

    // Si ya es "https://" o no empieza con ninguno de los dos, se devuelve el mismo URL sin cambios.
    return url;
  }

  String validateDescriptionEmpty(String? description) {
    if (description == null || description.isEmpty) {
      return "description not available";
    }

    return description;
  }
}
