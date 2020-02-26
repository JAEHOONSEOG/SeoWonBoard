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

  <title>Blog Post - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../../resources/css/blog.css" rel="stylesheet">

</head>

<body>

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
        </ul>
      </div>
    </div>
  </nav>

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
  </form>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Seowon Stone 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    $(document).ready(function(){

        var formObj = $("form[role='form']");

        console.log(formObj);

        $(".btn-primary").on("click", function(){
          formObj.submit();        	
        });
        
        /* $(".btn-warning").on("click", function(){
          self.location = "/board/listAll";
        }); */

        $(".btn-warning").on("click", function(){
            self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
                + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
          });
    });
  </script>
   
</body>
</html>