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

  <title>Blog Home - Start Bootstrap Template</title>

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
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/logout">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">Page Heading
          <small>Secondary Text</small>
        </h1>

        <c:forEach items="${list}" var="boardVO">
          <!-- Blog Post -->
          <div class="card mb-4">
            <!-- <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap"> -->
            <div class="card-body">
              <h2 class="card-title">${boardVO.bno}.  ${boardVO.title}</h2>
              <p class="card-text">${boardVO.content}</p>
              <%-- <a href="/board/read?bno=${boardVO.bno}" class="btn btn-primary">Read More &rarr;</a> --%>
              <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno }"
               class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regDate}" />
              by <a href="#">${boardVO.writer}</a>
            </div>
          </div>
        </c:forEach>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <c:if test="${pageMaker.prev}">
            <li class="page-item">
              <%-- <a class="page-link" href="listPage?page=${pageMaker.startPage - 1}">&larr; Older</a> --%>
              <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&larr; Older</a>
            </li>
          </c:if>
          
          <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <li class="page-item <c:out value="${pageMaker.cri.page == idx?'active' : ''  }"/>">
              <%-- <a class="page-link" href="listPage?page=${idx}">${idx}</a> --%>
              <a class="page-link" href="list${pageMaker.makeSearch(idx) }">${idx}</a>
            </li>  
          </c:forEach>
          
          <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
            <li class="page-item">
              <%-- <a class="page-link" href="listPage?page=${pageMaker.endPage + 1 }">Newer &rarr;</a> --%>
              <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">Newer &rarr;</a>
            </li>
          </c:if>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <!-- Select options -->
              <select class="form-control" name="searchType">
                <!-- No search condition -->
                <option value="n" <c:out value="${cri.searchType == null ? 'selected' : ''}"/>>
                  Select Search Type...
                </option>
                <!-- search condition : title -->
                <option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>
                  Title
                </option>
                <!-- search condition : content -->
                <option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>
                  Content
                </option>
                <!-- search condition : writer -->
                <option value="w" <c:out value="${cri.searchType eq 'w' ? 'selected' : '' }"/>>
                  Writer
                </option>
                <!-- search condition : title or content -->
                <option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }"/>>
                  Title or Content
                </option>
                <!-- search condition : content or writer -->
                <option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' : '' }"/>>
                  Content or  Writer 
                </option>
                <!-- search condition : title or content or writer -->
                <option value="tcw" <c:out value="${cri.searchType eq 'tcw' ? 'selected' : '' }"/>>
                  Title or Content or Writer
                </option>
              </select>
              <!-- Select options -->
            </div>
            <div class="input-group">
              <input type="text" name="keyword" id="keywordInput" 
                class="form-control" value="${cri.keyword }" placeholder="Search for...">
              <span class="input-group-btn">
              	<input type="hidden" id="makeQuery" value="${pageMaker.makeQuery(1)}">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
             </div>
             <div class="input-group"> 
              <h7><a href="/sboard/register">New Article</a></h7>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body">
            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Seowon 2020</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>