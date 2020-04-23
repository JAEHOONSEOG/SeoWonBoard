$(document).ready(function(){
	var template = Handlebars.compile($("#template").html());

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

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$(".btn-primary").on("click", function(){
		
		var that = $(this);
		var str = "";

		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' id='files["+ index + "]' name='files[" + index +"]' value='" + $(this).attr("href") + "'> ";
		});
		
		that.append(str);
		that.get(0).submit();
	});
	
	$(".uploadedList").on("click", "small", function(event){

		var that = $(this);
		alert("Get into the small area");
		alert("Get Data Src : " + $(this).attr("data-src"));
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
});

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName=" + fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/displayFile?fileName=" + front + end;
	} else {
		imgsrc = "/resources/img/attach.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName=" + fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);
	
	return {fileName: fileName, imgsrc: imgsrc, getLink: getLink, fullName: fullName};
}