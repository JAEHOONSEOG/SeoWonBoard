<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Seowon StoreHouse</title>

  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../../resources/js/modifyPage.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/blog.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="../com/navigation.jsp" />

  <form role="form" action="modifyPage" method="post">
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <input type="hidden" name="bno" value="${boardVO.bno }">
        <input type="hidden" name="page" value="${cri.page }">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
        
        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Title -->
          <hr>
          <div class="form-group">
            <h3 class="mt-4">Title</h3>
            <textarea class="form-control" name="title" rows="1">${boardVO.title}</textarea>
          </div>

          <hr>

          <!-- Date/Time -->
          <p>Posted on <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regDate}" /></p>

          <hr>

          <!-- Preview Image -->
          <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

          <hr>

          <!-- Post Content -->
          <h3 class="mt-4">Content</h3>
          <textarea class="form-control" name="content" rows="8">${boardVO.content}</textarea>

          <hr>
          
          <h3 class="mt-4">writer</h3>
          <input type="text" class="form-control" name="writer" value="${boardVO.writer}">
          
          <hr>
          
          <button type="submit" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-warning">Cancel</button>
          <br><br>
        </div>
        
        <!-- Sidebar Widgets Column -->
        <jsp:include page="../com/sideBar.jsp"/>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
  </form>

  <!-- Footer -->
  <jsp:include page="../com/footer.jsp"/>
</body>
</html>