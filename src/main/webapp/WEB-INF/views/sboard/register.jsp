<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script id="template" type="text/x-handlebars-template">
    <div>
      <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
      <div class="mailbox-attachment-info">
      <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
      <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
        <small data-src="{{fullName}}">x</small><i class="fa fa-fw fa-remove"></i>
      </a>
      </div>
    </div>
  </script>
  <script src="../../../resources/js/upload.js"></script>
</head>
<body>
  <!-- Navigation -->
  <jsp:include page="../com/navigation.jsp" />

  <form role="form" method="post">
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">
        
          <!-- Category -->
          <h1 class="my-4" id="entry-header">${category}</h1>

          <!-- Title -->
          <hr>

          <div class="form-group">
            <h3 class="mt-4">Title</h3>
            <textarea class="form-control" name="title" rows="1"></textarea>
          </div>

          <hr>

          <!-- Preview Image -->
          <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

          <hr>

          <!-- Post Content -->
          <h3 class="mt-4">Content</h3>
          <textarea class="form-control" name="content" rows="8"></textarea>

          <hr>
          
          <h3 class="mt-4">writer</h3>
          <input type="text" class="form-control" name="writer" value="${login.uid}">
          
          <hr>
          
   	      <div class="fileDrop">
          	<label for="exampleInputEmail">File DROP Here</label>
          	<div class="mailbox-attachments clearfix uploadedList"></div>
          </div>

          <hr>
          
          <button type="submit" id="registerForm" class="btn btn-primary">Submit</button>
          <br><br>
        </div>
        
        <!-- Sidebar Widgets Column -->
        <jsp:include page="../com/sideBar.jsp"/>

      <!-- /.row -->
	</div>
    </div>
    <!-- /.container -->
  </form>

  <!-- Footer -->
  <jsp:include page="../com/footer.jsp"/>
</body>
</html>