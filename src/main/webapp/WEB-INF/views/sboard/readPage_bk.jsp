<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>    
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

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <form role="form" method="post">
          <input type="hidden" name="bno" value="${boardVO.bno}">
        </form>
        
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
        
        <form role="form" action="modifyPage" method="post">
          <input type="hidden" name="bno" value="${boardVO.bno }">
          <input type="hidden" name="page" value="${cri.page }">
          <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
          <input type="hidden" name="searchType" value="${cri.searchType}">
          <input type="hidden" name="keyword" value="${cri.keyword }">
          <button type="submit" class="btn btn-warning">Modify</button>
          <button type="submit" class="btn btn-danger">Remove</button>
          <button type="submit" class="btn btn-primary">List All</button>
        </form>
        
        <hr>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>
          </div>
        </div>
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
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
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

        /* $(".btn-warning").on("click", function(){
          formObj.attr("action", "/board/modify");
          formObj.attr("method", "get");
          formObj.submit();
        }); */
        
        $(".btn-warning").on("click", function(){
            formObj.attr("action", "/sboard/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
          });

        $(".btn-danger").on("click", function(){

          formObj.attr("method", "post");
          formObj.attr("action", "/sboard/removePage");
          /* formObj.attr("action", "/board/remove"); */
          formObj.submit();
        });

        /* $(".btn-primary").on("click", function(){
            self.location = "/board/listAll";
          }); */

        $(".btn-primary").on("click", function(){
          formObj.attr("method", "get");
          formObj.attr("action", "/sboard/list");
          formObj.submit();
        });
    });
  </script>

</body>
</html>