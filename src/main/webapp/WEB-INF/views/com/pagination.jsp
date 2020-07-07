<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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