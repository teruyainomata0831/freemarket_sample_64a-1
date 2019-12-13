// // // 投稿確認


// Drop領域にドロップした際のファイルのプロパティ情報読み取り処理
function loadImage(event) {
  // （1）ドロップされたファイルのfilesプロパティを参照
  var files = event.dataTransfer.files;
  // var disp = document.getElementById("disp");
  
  // disp.innerHTML = "";
  for (var i = 0; i < 10; i++) {
    var f = files[i];
    var fileReader = new FileReader();
    fileReader.onload = (function (e) {
      
      document.getElementById('preview').innerHTML += '<img src="' + e.target.result + '">';
    });
    fileReader.readAsDataURL(f[i]);
    
    // // （2）ファイル名とサイズを表示
    // disp.innerHTML += "ファイル名 :" + f.name + "ファイルの型:" + f.type + "ファイルサイズ:" + f.size / 1000 + " KB " + "<br />";
  }
  // （3）ブラウザ上でファイルを展開する挙動を抑止
  event.preventDefault();

}

function printFile(file) {
  var reader = new FileReader();
  reader.onload = function(evt) {
    console.log(evt.target.result);
  };
  reader.readAsText(file);
}

function onDragOver(event) {
  // （4）ブラウザ上でファイルを展開する挙動を抑止
  event.preventDefault();
}




// // プレビュー
// function loadImage(obj)
// {
//   document.getElementById('preview').innerHTML = '<p>プレビュー</p>';
//   for (i = 0; i < 10; i++) {
//     var fileReader = new FileReader();
//     fileReader.onload = (function (e) {
//       document.getElementById('preview').innerHTML += '<img src="' + e.target.result + '">';
//     });
//     fileReader.readAsDataURL(obj.files[i]);
//     console.log(obj.files[i])
//   }
// }


// // function previewFile() {
// //   var preview = document.querySelector('img');
// //   var file    = document.querySelector('input[type=file]').files[0];
// //   var reader  = new FileReader();

// //   reader.addEventListener("load", function () {
// //     preview.src = reader.result;
// //   }, false);

// //   if (file) {
// //     reader.readAsDataURL(file);
// //   }
// // }





// // function previewFiles() {

// //   var preview = document.querySelector('#preview');
// //   var files   = document.querySelector('input[type=file]').files;

// //   function readAndPreview(file) {

// //     // Make sure `file.name` matches our extensions criteria
// //     if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
// //       var reader = new FileReader();

// //       reader.addEventListener("load", function () {
// //         var image = new Image();
// //         image.height = 100;
// //         image.title = file.name;
// //         image.src = this.result;
// //         preview.appendChild( image );
// //       }, false);

// //       reader.readAsDataURL(file);
// //     }

// //   }

// //   if (files) {
// //     [].forEach.call(files, readAndPreview);
// //   }

// // }