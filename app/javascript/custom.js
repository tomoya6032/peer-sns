document.getElementById('tweet_image').addEventListener('change', function(e) {
    const filename = e.target.files[0].name;
    document.getElementById('image-name').innerText = filename;
});
  