<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #modDiv {
    width:300px;
    height:100px;
    background-color: gray;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -5%;
    margin-left: -15%;
    padding: 10px;
    z-index: 1000;
  }
</style>

  <!-- Bootstrap core CSS -->
  <link href="../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../resources/css/blog.css" rel="stylesheet">
</head>
<body>
 <h2>Ajax Test Page</h2>
   <div>
    <div>
      REPLYER <input type="text" name="replyer" id="newReplyWriter">
    </div>
    <div>
      REPLY TEXT <input type="text" name="replytext" id="newReplyText">
    </div>
    <div>
      <button id="replyAddBtn">ADD REPLY</button>
    </div>
    <div>
      <ul id="replies">
     
      </ul>
      <ul class="pagination justify-content-center mb-4">
        
      </ul>
    </div>
 </div>

 <div id="modDiv" style="display: none;">
   <div class="modal-title"></div>
   <div>
     <input type="text" id="replytext">
   </div>
   <div>
     <button type="button" id="replyModBtn">Modify</button>
     <button type="button" id="replyDelBtn">Delete</button>
     <button type="button" id="closeBtn">Close</button>
   </div>
 </div>
 <!-- jQuery -->
 <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
 <script>
  var bno = 10;

  getPageList(1);
  
  function getAllList(){
	var str = "";
	$.getJSON("/replies/all/" + bno, function(data){
	   console.log(data.length);
	    
	   $(data).each(
	     function(){
	       str += "<li data-rno='" + this.rno + "' class='replyLi'>"
	           + this.rno + ":" + this.replyText
	           + "<button>MOD</button></li>";
	     });

	   $("#replies").html(str);
	 });
  }

  function getPageList(page){

    $.getJSON("/replies/" + bno + "/" + page, function(data){

      console.log(data.list.lenth);

      var str = "";

      $(data.list).each(function(){
        str += "<li data-rno='" + this.rno + "' class='replyLi'>"
            + this.rno + ":" + this.replyText
            + "<button>MOD</button></li>";
      });

      $("#replies").html(str);
      printPaging(data.pageMaker);
    });
  }

  function printPaging(pageMaker){

    var str = "";

    if(pageMaker.prev){
      str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> &larr;</a></li>";
    }

    for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
      var strClass = pageMaker.cri.page == i ? 'class=active' : '';
      str += "<li class='page-item " + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
    }

    if(pageMaker.next){
      str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'> &rarr;</a></li>";
    }
    $(".pagination").html(str);
  }

  $("#replyAddBtn").on("click", function(){

    var replyer = $("#newReplyWriter").val();
    var replytext = $("#newReplyText").val();

    $.ajax({
      type : "post",
      url : "/replies/",
      headers : {
        "Content-Type" : "application/json",
        "X-HTTP-Method-Override" : "POST"
      },
      dataType : "text",
      data : JSON.stringify({
        bno : bno,
        replyer : replyer,
        replyText : replytext
      }),
      success : function(result){
        if(result == "success"){
          alert("Reply Submitted.");
          getAllList();
        }
      }
    }) ;
  });

  $("#replies").on("click", ".replyLi button", function(){

    var reply = $(this).parent();

    var rno = reply.attr("data-rno");
    var replytext = reply.text();

    //alert(rno + " : " + replytext);
    $(".modal-title").html(rno);
    $("#replytext").val(replytext);
    $("#modDiv").show("slow");
  });

  $("#replyDelBtn").on("click", function(){

    var rno = $(".modal-title").html();
    var replytext = $("#replytext").val();

    $.ajax({
      type : "delete",
      url : "/replies/" +rno,
      headers : {
        "Content-Type" : "application/json",
        "X-Http-Method-Override" : "DELETE" 
      },
      dataType : "text",
      success : function(result){
        console.log("result : " + result);
        if(result == "success"){
          alert("Delete Completed");
          $("#modDiv").hide("slow");
          getAllList();
        }
      }
    });
  });

  $("#replyModBtn").on("click", function(){

    var rno = $(".modal-title").html();
    var replytext = $("#replytext").val();

    $.ajax({
      type : "put",
      url : "/replies/" + rno,
      headers : {
        "Content-Type" : "application/json",
        "X-Http-Method-Override" : "PUT"
      },
      data : JSON.stringify({replyText : replytext}),
      dataType : "text",
      success : function(result){
        console.log("result : " + result);
        if(result == "success"){
          alert("Modifying Completed");
          $("#modDib").hide("slow");
          // getAllList();
          getPageList(replyPage);
        }
      }
    });
  });

  var replyPage = 1;

  $(".pagination").on("click", "li a", function(event){

    event.preventDefault();

    replyPage = $(this).attr("href");

    getPageList(replyPage);
  });
 </script>
 
   <!-- Bootstrap core JavaScript -->
  <script src="../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>