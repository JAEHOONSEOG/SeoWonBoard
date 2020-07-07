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

  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../../resources/js/list.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/blog.css" rel="stylesheet">

</head>

<body>
  <script>
    var result = '${msg}';
    if(result == "success")
    {
      alert("The process is completed");
        }
  </script>

  <!-- Navigation -->
  <jsp:include page="../com/navigation.jsp" />

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4" id="entry-header">${category}</h1>

        <c:forEach items="${list}" var="boardVO">
          <!-- Blog Post -->
          <div class="card mb-4">
            <div class="card-body">
              <h2 class="card-title">${boardVO.bno}.  ${boardVO.title}</h2>
              <p class="card-text">${boardVO.content}</p>
              <%-- <a href="/board/read?bno=${boardVO.bno}" class="btn btn-primary">Read More &rarr;</a> --%>
              <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno }&category=${category}"
               class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regDate}" />
              by <a href="#">${boardVO.writer}</a>
            </div>
          </div>
        </c:forEach>

        <!-- Pagination -->
        <jsp:include page="../com/pagination.jsp"/>

      </div>
	  
	  <!-- Sidebar Widgets Column -->
	  <jsp:include page="../com/sideBar.jsp"/>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <jsp:include page="../com/footer.jsp"/>
</body>
</html>