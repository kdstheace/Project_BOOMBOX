<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search</title>
	<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <style>
        * {
            font-family: 'Do Hyeon';
        }
        .grid_title {
            font-size: 30px;
        }
        .upper-bar {
            background-color: #ffd343 !important;
            font-size: 20px;
        }

        .search-bar {
            width: 70% !important;
            margin-left: 20px;
            min-width: 300px;
        }

        .main-logo {
            width: 300px;
            height: 100px;
            min-width: 300px;
        }
        
        .dropdown-item {
		  font-size: 20px;
		}
        
        
        /* sidebar */
		#wrapper {
		    overflow-x: hidden;
		 }
		
		#sidebar-wrapper {
		  min-height: 100vh;
		  margin-left: -15rem;
		  -webkit-transition: margin .25s ease-out;
		  -moz-transition: margin .25s ease-out;
		  -o-transition: margin .25s ease-out;
		  transition: margin .25s ease-out;
		}
		
		#sidebar-wrapper .sidebar-heading {
		  padding: 0.875rem 1.25rem;
		  font-size: 1.2rem;
		}
		
		#sidebar-wrapper .list-group {
		  width: 15rem;
		}
		
		#page-content-wrapper {
		  min-width: 100vw;
		}
		
		#wrapper.toggled #sidebar-wrapper {
		  margin-left: 0;
		}
		
		@media (min-width: 768px) {
		  #sidebar-wrapper {
		    margin-left: 0;
		  }
		
		  #page-content-wrapper {
		    min-width: 0;
		    width: 100%;
		  }
		
		  #wrapper.toggled #sidebar-wrapper {
		    margin-left: -15rem;
		  }
		}

    </style>

</head>
<body>
				<jsp:include page="/WEB-INF/views/menu/navi.jsp" />

</body>
</html>