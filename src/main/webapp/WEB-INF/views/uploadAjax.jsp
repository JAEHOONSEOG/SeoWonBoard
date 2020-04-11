<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Upload Ajax</title>
<style>
.fileDrop {
  width: 1200px;
  height: 200px;
  border: 1px dotted blue;
}

small {
  margin-left: 3px;
  font-weight: bold;
  color: gray;
}
</style>
</head>
<body>
  
  <h3>Ajax File Upload</h3>
  <div class="fileDrop"></div>
  
  <div class="uploadedList"></div>

<script src="../../../resources/vendor/jquery/jquery.min.js"></script>
<script>
  $(".fileDrop").on("dragenter dragover", function(event){
    event.preventDefault();
  });

  $(".fileDrop").on("drop", function(event){
    event.preventDefault();

    var files = event.originalEvent.dataTransfer.files;

    var file = files[0];

    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
      url: "/uploadAjax",
      data: formData,
      dataType: "text",
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data){
        alert(data);

        var str = "";

        console.log("Data : " + data);
        console.log("CheckImageType : " + checkImageType(data));
        
        if(checkImageType(data)) {
          str += "<div><a href=displayFile?fileName=" + getImageLink(data) + ">"
                 + "<img src='displayFile?fileName=" + data + "'/>"
                 + "</a><small data-src=" + data + ">X</small></div>";
        } else {
          str += "<div><a href='displayFile?fileName=" + data + "/'>"
                 + getOriginalName(data) + "</a>" 
                 + "<small data-src="+ data +">X</small></div>";
        }
        $(".uploadedList").append(str);
      }
    });
  });

  function getOriginalName(fileName) {
    if(checkImageType(fileName)) {
      return;
    }

    var idx = fileName.indexOf("_") + 1;
    console.log("Get File Name From getOrigianlName : " + fileName.substring(idx));
    return fileName.substring(idx);
  }

  function getImageLink(fileName) {
	console.log("Get into getImageLink func");
    if(!checkImageType(fileName)){
      return;
    }

    var front = fileName.substr(0,12);
    var end = fileName.substr(14);
    console.log("Front : " + front);
    console.log("End : " + end);

    return front + end;
  }
  
  function checkImageType(fileName) {
    var pattern = /jpg|gif|png|jpeg/i;
    return fileName.match(pattern);
  }

  $(".uploadedList").on("click", "small", function(event){

    var that = $(this);

    $.ajax({
      url: "deleteFile",
      type: "post",
      data: {fileName:$(this).attr("data-src")},
      dataType: "text",
      success: function(result){
        if(result == "delete"){
          alert("deleted");
          that.parent("div").remove();
        }
      }
    });
  });    
</script>  
</body>
</html>