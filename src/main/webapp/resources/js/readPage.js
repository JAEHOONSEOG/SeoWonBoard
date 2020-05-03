/**
* Read Page js 
*/
$(document).ready(function(){

    var formObj = $("form[role='form']");

    console.log(formObj);
    
    var bno = $("#bno").val();

    $(".btn-warning").on("click", function(){
    	formObj.attr("action", "/sboard/modifyPage");
        formObj.attr("method", "get");
        formObj.submit();
      });

    $(".btn-danger").on("click", function(){

      var replyCnt = $("#replyCntSmall").html();
      
      if(replyCnt > 0) {
    	  alert("Can't remove the article with replies");
    	  return;
      }
      
      var arr = [];
      $("#fileList").each(function(index){
    	 arr.push($(this).attr("data-src")); 
      });
      
      if(arr.length > 0)
    	  $.post("/deleteAllFiles", {files:arr}, function(){
    		  
    	  })
    	
      formObj.attr("method", "post");
      formObj.attr("action", "/sboard/removePage");
      formObj.submit();
    });

    $(".btn-primary").on("click", function(){
      formObj.attr("method", "get");
      formObj.attr("action", "/sboard/list");
      formObj.submit();
    });
    
    $(".btn-secondary").on("click", function(event){
    	var makeQuery = $("#makeQuery").val();
		self.location = "list"
			+ makeQuery
            + "&searchType="
            + $("select option:selected").val()
            + "&keyword=" + $("#keywordInput").val();
    });

    var replyPage = 1;
    
    /* Event process of replies list */
    $("#repliesDiv").on("click", function(){
      var status = document.getElementById("replies").style.display;
      if(status == "none"){
        $("#replies").show("slow");
        $(".pagination").show("slow");
      }
      else {
        $("#replies").hide("slow");
        $(".pagination").hide("slow");
      }
      getPage("/replies/" + bno + "/1");
    });

    /* Paging event process of replies */
    $("#pagination").on("click", "li a", function(event){

      event.preventDefault();

      replyPage = $(this).attr("href");

      getPage("/replies/" + bno + "/" + replyPage);
    });

    /* Get Comment List */
    getPage("/replies/" + bno + "/1");
    
    /* Add reply */
    $("#replyAddBtn").on("click", function(){

      var replyerObj = $("#newReplyWriter");
      var replytextObj = $("#newReplyText");
      var replyer = replyerObj.val();
      var replytext = replytextObj.val();

      $.ajax({
        type : "post",
        url : "/replies/",
        headers : {
          "Content-Type" : "application/json",
          "X-HTTP-Method-Override" : "POST"
        },
        dataType : "text",
        data : JSON.stringify({bno:bno, replyer:replyer, replyText:replytext}),
        success : function(result){
          console.log("result : " + result);
          if(result == "success"){
            alert("Reply Registered");
            replyPage = 1;
            getPage("/replies/" + bno + "/" + replyPage);
            replyerObj.val("");
            replytextObj.val("");
          }
        }
      });  
    });
    
    /* Modify Reply */
    $("#replyModBtn").on("click", function(){

      var rno = $(".modal-title").html();
      var replytext = $("#replytext").val();

      $.ajax({
        type : "put",
        url : "/replies/" + rno,
        headers: {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "PUT", 
        },
        data : JSON.stringify({replyText : replytext}),
        dataType : "text",
        success : function(result){
          console.log("result : " + result);
          if(result == "success"){
            alert("Reply Modification is completed");
            getPage("/replies/" + bno + "/" + replyPage);
          }
        }
      });
    });

    /* Remove Reply */
    $("#replyDelBtn").on("click", function(){

      var rno = $(".modal-title").html();
      var replytext = $("#replytext").val();

      $.ajax({
          type : "delete",
          url : "/replies/" + bno + "/" + rno,
          headers: {
                 "Content-Type" : "application/json",
                 "X-HTTP-Method-Override" : "DELETE", 
          },
          dataType : "text",
          success : function(result){
            console.log("result : " + result);
            if(result == "success"){
              alert("Reply is deleted");
              getPage("/replies/" + bno + "/" + replyPage);
            }
          }
        });
    });
    
    // Add Template 
    var template = Handlebars.compile($("#templateAttach").html());
    var bno = $('#bno').val();
    
    $.getJSON("/sboard/getAttach/" + bno, function(data){
    	$(data).each(function(){
    		var fileInfo = getFileInfo(this);
    		var html = template(fileInfo);
    		$(".uploadedList").append(html);
    	});
    })
    
    $(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
    	var fileLink = $(this).attr("href");
    	
    	if(checkImageType(fileLink)){
    		
    		event.preventDefault();
    		
    		var imgTag = $("#popup_img");
    		imgTag.attr("src", fileLink);
    		
    		console.log(imgTag.attr("src"));
    		
    		$(".popup").show("slow");
    		imgTag.addClass("show");
    	}
    });

    $("#popup_img").on("click", function(){
    	$(".popup").hide("slow");
    });
});

/* Comment Paging Process */
function getPage(pageInfo){

  var loginUser = $("#loginUser").val();
  $.getJSON(pageInfo, function(data){

    var str = "";
    $(data.list).each(function(index){
        str += "<div class='media mb-4'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50' alt=''>"
            + "<div class='media-body' id='timeline-body'><h5 class='mt-0' id='replyer'>" + this.replyer + "</h5>"
			+ this.replyText
			+ "<input type='hidden' id='comment-rno-" + this.rno + "' value='" + this.rno + "'>"
			+ "<input type='hidden' id='comment-replytext-" + this.rno + "' value='" + this.replyText + "'>"
			+ "</div>" 
			+ "<div class='timeline-footer'>";
			if(this.replyer == loginUser) {
				str += "<a class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modifyModal' onclick='replyModify("
					+ this.rno
					+ ")'>Modify</a>";
			}
				
			str += "</div>"
			+ "</div>";
    });
    $("#replies").html(str);
    
    printPaging(data.pageMaker, $(".pagination"));

  });
  
}

var printPaging = function(pageMaker, target){
  var str = "";

  if(pageMaker.prev){
    str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage-1) 
        +"' style='width:35px; height:30px;'>&larr; Older</a></li>";
  }

  for(var i = pageMaker.startPage, len = pageMaker.endPage; i < len; i++){
    var strClass = pageMaker.cri.page == i ? 'active' : '';
    str += "<li class='page-item " + strClass + "' ><a class='page-link' href='" + i 
        + "' style='width:35px; height:30px;'>" + i + "</a></li>";
  }
  
  if(pageMaker.next){
    str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) 
        + "' style='width:35px; height:30px;'>Newer &rarr;</a></li>";
  }
  target.html(str);
}

/* Reply modify modal */
function replyModify(rno){

  var commentRno = "#comment-rno-" + rno;
  var ReplyTxtRno = "#comment-replytext-" + rno;   
  
  $("#replytext").val($(ReplyTxtRno).val());
  $(".modal-title").html($(commentRno).val());
  
};

function checkImageType(fileName) {
    var pattern = /jpg|gif|png|jpeg/i;
    return fileName.match(pattern);
}

function getFileInfo(fullName){
	console.log("Get FullName : " + fullName);
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