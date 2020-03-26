/**
 * Read Page js 
 */
$(document).ready(function(){

        var formObj = $("form[role='form']");

        console.log(formObj);

        $(".btn-warning").on("click", function(){
            formObj.attr("action", "/sboard/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
          });

        $(".btn-danger").on("click", function(){

          formObj.attr("method", "post");
          formObj.attr("action", "/sboard/removePage");
          formObj.submit();
        });

        $(".btn-primary").on("click", function(){
          formObj.attr("method", "get");
          formObj.attr("action", "/sboard/list");
          formObj.submit();
        });
    });

    /*var bno = ${boardVO.bno};*/
    var bno = $("#bno").val();
    var replyPage = 1;

    /* Get Comment List */
    getPage("/replies/" + bno + "/1");

    /* Comment Paging Process */
    function getPage(pageInfo){

      $.getJSON(pageInfo, function(data){

        console.log(data.list.length);

        var str = "";
        $(data.list).each(function(index){
            str += "<div class='media mb-4'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50' alt=''>"
                + "<div class='media-body' id='timeline-body'><h5 class='mt-0' id='replyer'>" + this.replyer + "</h5>"
    			+ this.replyText
    			+ "<input type='hidden' id='comment-rno-" + this.rno + "' value='" + this.rno + "'>"
    			+ "<input type='hidden' id='comment-replytext-" + this.rno + "' value='" + this.replyText + "'>"
    			+ "</div>" 
    			+ "<div class='timeline-footer'>"
    			+ "<a class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modifyModal' onclick='replyModify("
    			+ this.rno
    			+ ")'>Modify</a></div>"
    			+ "</div>"; 
        });
        $("#replies").html(str);
        
        printPaging(data.pageMaker, $(".pagination"));

      });
      
    }

    var printPaging = function(pageMaker, target){
      console.log("Get into the pagination process...")
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
      console.log("Pagination str : " + str);
      target.html(str);
    }

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

    /* Add reply */
    $("#replyAddBtn").on("click",function(){

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

    /* Reply modify modal */
    function replyModify(rno){

      var commentRno = "#comment-rno-" + rno;
      var ReplyTxtRno = "#comment-replytext-" + rno;   
      
      $("#replytext").val($(ReplyTxtRno).val());
      $(".modal-title").html($(commentRno).val());
      
    };

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