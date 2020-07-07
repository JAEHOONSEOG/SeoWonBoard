<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Seowon StoreHouse</title>

  <!-- Bootstrap core CSS -->
  <link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/blog.css" rel="stylesheet">

  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

  <script id="templateAttach" type="text/x-handlebars-template">
    <div id="fileList" data-src="{{fullName}}">
      <!--<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>-->
      <div class="mailbox-attachment-info">
        <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
      </div>
    </div>
  </script>
  <script src="../../../resources/js/readPage.js"></script>
</head>
<body>
  <!-- Navigation -->
  <jsp:include page="../com/navigation.jsp" />

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <input type="hidden" id="bno" name="bno" value="${boardVO.bno}">
        
        <!-- Title -->
        <h1 class="mt-4">${boardVO.title}</h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="#">${boardVO.writer}</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p>Posted on <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regDate}" /></p>

        <hr>

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

        <hr>

        <!-- Post Content -->
        <p class="lead">${boardVO.content}</p>

        <hr>
        
		<div class="mailbox-attachments clearfix uploadedList"></div>
		
		<div class="popup back" style="display:none;"></div>
		<div id="popup front" class="popup front" style="display:none">
		  <img id="popup_img">
		</div>
        
        <hr>
        
        <form role="form" action="modifyPage" method="post">
          <input type="hidden" name="bno" value="${boardVO.bno }">
          <input type="hidden" name="page" value="${cri.page }">
          <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
          <input type="hidden" name="searchType" value="${cri.searchType}">
          <input type="hidden" name="keyword" value="${cri.keyword }">
          <input type="hidden" name="category" value="${boardVO.category }">
		  
		  <c:if test="${login.uid == boardVO.writer }">          
          	<button type="submit" class="btn btn-warning">Modify</button>
          	<button type="submit" class="btn btn-danger">Remove</button>
          </c:if>
          <button type="submit" class="btn btn-primary">Go List</button>
        </form>
        
        <hr>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <!-- <form> -->
            <c:if test="${not empty login }">
              <div class="form-group">
                <p>Writer</p>
                <p><input type="text" class="form-control" id="newReplyWriter" 
                	placeholder="USER ID" value="${login.uid}" readonly="readonly"></p>
                <p>Comments</p>
                <p><textarea class="form-control" id="newReplyText" rows="3" placeholder="Comments"></textarea></p>
              </div>
              <button type="submit" id="replyAddBtn" class="btn btn-success">Submit</button>
            </c:if>  
            <!-- </form> -->
            <c:if test="${empty login }">
              <div class="box-body">
                <div><a href="javascript:gologin();">Login Please</a></div>
              </div>
            </c:if>
          </div>
        </div>

        <hr>

        <div class="btn btn-info">
          <span id="repliesDiv" class="bg-green">Replies List</span>
        </div>
        
        <hr>
        
        <input type="hidden" id="loginUser" value="${login.uid}">
        
        <!-- Single Comment -->
        <div id="replies" style="display: none;">
        </div>
        
        <!-- pagination -->
        <div class="text-center">
          <ul id="pagination" class="pagination pagination-sm " style="display: none;">
          </ul>
        </div>
      </div>

      <!-- Sidebar Widgets Column -->
      <jsp:include page="../com/sideBar.jsp"/>
    <!-- /.row -->

  </div>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <jsp:include page="../com/footer.jsp"/>
</body>
</html>