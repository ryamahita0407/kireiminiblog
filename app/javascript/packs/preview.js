if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      if (imageElementNum <= 1 ) {
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `miniblog_image_${imageElementNum}`)
        inputHTML.setAttribute('name', 'miniblog[images][]')
        inputHTML.setAttribute('type', 'file')

        imageElement.appendChild(blobImage);
        imageElement.appendChild(inputHTML)
        ImageList.appendChild(imageElement);
  
        inputHTML.addEventListener('change', (e) => {
          file = e.target.files[0];
          blob = window.URL.createObjectURL(file);
  
          createImageHTML(blob)
        })
      } else{
        return false;
      }
    };

    document.getElementById('miniblog-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}