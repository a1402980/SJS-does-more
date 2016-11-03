<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/css/materialize.min.css" />"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="<c:url value="/resouces/styles/css/materialize.css" />"  media="screen,projection"/>
	  <!--Import MEIDÄN OMA CSS -->
	  <link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/css/general.css" />"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	  
		  
    </head>

<body>
<div id="etusivu_taustakuva">
      <ul id="dropdown1" class="dropdown-content">
      <li><a href="?lang=fi">FI</li>
      <li><a href="?lang=en">EN</li>
      </ul>

  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo center"><img class="responsive-img" src="<c:url value="/resources/images/logo2_s.png" />" alt="Do" id="navlogo" /></a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="left hide-on-med-and-down">
        <li><a href="#"><spring:message code="etusivu"/></a></li>
        <li><a href="#"><spring:message code="luotapahtuma"/></a></li>
        <li><a href="#"><spring:message code="etsitapahtuma"/></a></li>
        <li><a href="#"><spring:message code="yhteystiedot"/></a></li>
      </ul>
       <!-- Dropdown Trigger -->
      
	  <ul class="right">
	  <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons">language</i><i class="material-icons right">arrow_drop_down</i></a></li>
	  </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="#"><span class="material-icons" id="navicon">home</span><spring:message code="etusivu"/></a></li>
        <li><a href="#"><span class="material-icons" id="navicon">event_note</span><spring:message code="luotapahtuma"/></a></li>
        <li><a href="#"><span class="material-icons" id="navicon">search</span><spring:message code="etsitapahtuma"/></a></li>
        <li><a href="#"><span class="material-icons" id="navicon">phone</span><spring:message code="yhteystiedot"/></a></li>
      </ul>
    </div>
  </nav>


<div class="keskella">
<a class="waves-effect waves-light btn" href="luotapahtuma"><i class="material-icons left">playlist_add</i>Luo tapahtumia</a>
<a class="waves-effect waves-light btn" href="tapahtumat"><i class="material-icons right">reorder</i>Näytä tapahtumia</a>
</div>


</div>
      <!--Import jQuery before materialize.js AINA LOPPUUN!!!!!!!!!!!-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js" />"></script>
	  	<script type="text/javascript" src="<c:url value="/resources/js/materialize.js" />"></script>
		<script>
		
  $('.button-collapse').sideNav({
  // Initialize collapse button
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
    // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  //$('.collapsible').collapsible();
	</script>
	
	
    </body>
  </html>