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

  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

  <script id="templateAttach" type="text/x-handlebars-template">
    <div data-src="{{fullName}}">
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

        <%-- <form role="form" method="post">
          <input type="hidden" name="bno" value="${boardVO.bno}">
        </form> --%>
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
          <button type="submit" class="btn btn-warning">Modify</button>
          <button type="submit" class="btn btn-danger">Remove</button>
          <button type="submit" class="btn btn-primary">List All</button>
        </form>
        
        <hr>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <!-- <form> -->
              <div class="form-group">
                <p>Writer</p>
                <p><input type="text" class="form-control" id="newReplyWriter"></p>
                <p>Comments</p>
                <p><textarea class="form-control" id="newReplyText" rows="3"></textarea></p>
              </div>
              <button type="submit" id="replyAddBtn" class="btn btn-success">Submit</button>
            <!-- </form> -->
          </div>
        </div>

        <hr>

        <div class="btn btn-info">
          <span id="repliesDiv" class="bg-green">Replies List</span>
        </div>
        
        <hr>
        
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
        
        <!-- Modal -->
        <div id="modifyModal" class="modal modal-primary fade" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body" data-rno>
                <p><input type="text" id="replytext" class="form-control"></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-info" id="replyModBtn" data-dismiss="modal">Modify</button>
                <button type="button" class="btn btn-secondary" id="replyDelBtn" data-dismiss="modal">Delete</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
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
      <p class="m-0 text-center text-white">Copyright &copy; Seowon 2020</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>