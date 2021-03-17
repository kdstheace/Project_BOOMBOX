<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Search</title>
      <link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
      <script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
      									<!-- google -->
				<meta name="google-signin-scope" content="profile email">
				<meta http-equiv="X-UA-Compatible" content="ie=edge">
				<script src="https://apis.google.com/js/platform.js" async defer></script>
				<meta name="google-signin-client_id"
					content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">
					      <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
      <style>
        * {
          font-family: 'Do Hyeon';
        }

        .main_container {
          padding-top: 30px;
          padding-left: 30px;
        }

        .card {
          height: 200px;
        }

        .feed_img {
          width: 100%;
          max-height: 200px;
        }
      </style>

    </head>

    <body>
      <jsp:include page="/WEB-INF/views/menu/navi.jsp" />
      <!-- main content -->
      <div class="row main_container">
        <div class="col-md-10">
          <!-- content section -->
          <div class="container-fluid">
            <div class="container-fluid pb-1 border-bottom">
              <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                  <div class="panel-heading" role="tab" id="headingOne">
                    <div class="panel-title">
                      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne">
                        <svg style="height: 24px; width: 24px;" viewBox="0 0 24 24">
                          <path
                            d="M3 17v2h6v-2H3zM3 5v2h10V5H3zm10 16v-2h8v-2h-8v-2h-2v6h2zM7 9v2H3v2h4v2h2V9H7zm14 4v-2H11v2h10zm-6-4h2V7h4V5h-4V3h-2v6z"
                            fill="#606060"></path>
                        </svg>
                        <span class="accordion_btn">FILTER</span>
                    </div>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-8">
                          <table class="table table-borderless table-sm">
                            <thead>
                              <tr>
                                <th scope="col" class="border-bottom pl-2 pr-2">UPLOAD DATE</th>
                                <th scope="col" class="border-bottom">TYPE</th>
                                <th scope="col" class="border-bottom">DURATION</th>
                                <th scope="col" class="border-bottom">FEATURES</th>
                                <th scope="col" class="border-bottom">SORT BY</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>Last hour</td>
                                <td>Video</td>
                                <td>Short (<4 minutes)</td>
                                <td>Live</td>
                                <th>Relevance</th>
                              </tr>
                              <tr>
                                <td>Today</td>
                                <td>Channel</td>
                                <td>Long (>20 minutes)</td>
                                <td>4K</td>
                                <td>Upload date</td>
                              </tr>
                              <tr>
                                <td>This week</td>
                                <td>Playlist</td>
                                <td></td>
                                <td>HD</td>
                                <td>View count</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            <div class="container-fluid mt-4">
              <c:forEach items="${list }" var="video">
                <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
                  <div class="card">
                    <div class="row">
                      <div class="col-md-4">
                        <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" alt="image" class="feed_img" />
                      </div>
                      <div class="col-md-7 p-0 pt-2">
                        <div class="row">
                          <div class="col-1 ml-2 mr-3 desc_hide">
                             <c:choose>
                                 <c:when test="${video.STAGE_PROFILEIMGO != null }">
                                     <img id="img" height="50"  src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
                                         class="rounded-circle">
                                 </c:when>
                                 <c:otherwise>
                                     <img id="img" height="50" src="${video.USER_GOOGLEIMG }" class="rounded-circle">
                                 </c:otherwise>
                             </c:choose>

                          </div>
                          <div class="col-9">
                            <h3 class="mb-1 title" title="${video.VIDEO_TITLE }">${video.VIDEO_TITLE }</h3>
                            <p class="subtitle">
                              ${video.USER_NAME } <i class="fas fa-check-circle"></i><br>
                              <i class="fas fa-eye"></i> ${video.VIDEO_HIT } ${video.VIDEO_INDATE }
                            </p>
                            <div class="short_description">
                              ${video.VIDEO_CONTENT }
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>
                </a>
              </c:forEach>
              <script>
                function searchFnc(page) {
                  var searchform = document.getElementById("searchForm");
                  console.log("펑션으로 들어옴.");
                  document.getElementById("page").value = page;
                  searchForm.submit();
                }
              </script>
              <br>
              <div>
                <a href="javascript:searchFnc(${navi.currentPage - navi.pagePerGroup});">◁◁</a>
                <a href="javascript:searchFnc(${navi.currentPage - 1 });">◀</a>
                <c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
                  <c:choose>
                    <c:when test="${counter == navi.currentPage }">
                      <b>${counter }</b>
                    </c:when>
                    <c:otherwise>
                      <a href="javascript:searchFnc(${counter });">${counter }</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <a href="javascript:searchFnc(${navi.currentPage + 1 });">▶</a>
                <a href="javascript:searchFnc(${navi.currentPage + navi.pagePerGroup});">▷▷</a>
              </div>
            </div>

          </div>

        </div>

      </div>

      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
        crossorigin="anonymous"></script>
      <!-- content Section -->
    </body>

    </html>