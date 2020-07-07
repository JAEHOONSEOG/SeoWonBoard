<div class="col-md-4">

  <!-- Search Widget -->
  <div class="card my-4">
    <h5 class="card-header" id="side-menu">Search</h5>
    <div class="card-body" id="side-menu">
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
        <h7><a href="/sboard/register?category=${category}">New Article</a></h7>
      </div>
    </div>
  </div>

  <!-- Categories Widget -->
  <div class="card my-4">
    <h5 class="card-header" id="side-menu">Categories</h5>
    <div class="card-body" id="side-menu">
      <div class="row">
        <div class="col-lg-6">
          <ul class="list-unstyled mb-0">
            <li>
            	<a href="/sboard/list?category=Mindcasting">Mindcasting</a>
            </li>
            <li>
              <a href="/sboard/list?category=ProSpring5">Pro Spring 5</a>
            </li>
            <li>
              <a href="/sboard/list?category=Spring5DesignPattern">Design Pattern</a>
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
    <h5 class="card-header" id="side-menu">Side Widget</h5>
    <div class="card-body" id="side-menu">
      You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
    </div>
  </div>

</div>