document.addEventListener('DOMContentLoaded', function () {
  const gallery = document.getElementById('ai-gallery');

  // Array de nombres de archivo de las imágenes
  const imageNames = [
    'images/image1.jpeg',
    'images/image2.jpeg',
    'images/image3.jpeg',
    'images/image4.jpeg',
    // Agrega más nombres de archivo si tienes más imágenes en la carpeta
  ];

  // Recorrer el array de nombres de archivo para crear elementos de imagen en la galería
  imageNames.forEach(imageName => {
    const aiItem = document.createElement('div');
    aiItem.classList.add('ai-item');

    const img = document.createElement('img');
    img.src = imageName;
    img.alt = 'AI Generated Image';
    aiItem.appendChild(img);

    gallery.appendChild(aiItem);
  });
});
