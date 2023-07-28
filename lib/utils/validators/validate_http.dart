class Validators {
  String validateAndConvertToHttps(String url) {
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
