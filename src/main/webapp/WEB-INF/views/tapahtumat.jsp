<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

      <ul id="dropdown1" class="dropdown-content">
      <li><a href="#">FI</li>
      <li><a href="#">EN</li>
      </ul>

  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo center"><img class="responsive-img" src="<c:url value="/resources/images/logo2_s.png" />" alt="Do" id="navlogo" /></a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="left hide-on-med-and-down">
        <li><a href="#">Etusivu</a></li>
        <li><a href="#">Luo tapahtuma</a></li>
        <li><a href="#">Etsi tapahtuma</a></li>
        <li><a href="#">Yhteystiedot</a></li>
      </ul>
       <!-- Dropdown Trigger -->
      
	  <ul class="right">
	  <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons">language</i><i class="material-icons right">arrow_drop_down</i></a></li>
	  </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="#"><span class="material-icons" id="navicon">home</span> Etusivu</a></li>
        <li><a href="#"><span class="material-icons" id="navicon">event_note</span> Luo tapahtuma</a></li>
        <li><a href="#"><span class="material-icons" id="navicon">search</span> Etsi tapahtuma</a></li>
        <li><a href="#"><span class="material-icons" id="navicon">phone</span> Yhteystiedot</a></li>
      </ul>
    </div>
  </nav>
          
	
	<div class="row" id="ruutu">
	
	<div  class="container center-align">
	
	
	
	<h2><spring:message code="result.heading"/><i class="material-icons">keyboard_arrow_down</i></h2>
	</div>
	
	 <ul class="collapsible" data-collapsible="accordion">
	 <c:forEach items="${tapahtumat}" var="tapahtuma">
    <li class="collection-item avatar">
	  <div class="collapsible-header hoverable">
      <span class="title">${tapahtuma.nimi}</span>
      <p><span class="material-icons">query_builder</span>Aika:<fmt:formatDate pattern="hh:mm" value="${tapahtuma.aika}"/> 
      <span class="material-icons">today</span>Päivämäärä: <fmt:formatDate pattern="dd.MM.yyyy" value="${tapahtuma.pvm}"/>
      <span class="material-icons">place</span>Paikka: ${tapahtuma.paikka}</p>
	  </div>
	  <div class="collapsible-body">
	  
	  	  <div class="col s10">
	  <p class="title">Lisätietoa</p>
	  </div>
	  
	  		   <div class="col m2 card small right">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="<c:url value="/resources/images/profile.jpg" />">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-3">Ei-Ella Esiintyjä</span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Tietoa minusta<i class="material-icons right">close</i></span>
      <p>Hei! Olen Ella ja opiskelen Teatterikorkeakoulussa esiintymistä. 
      Minulla on 15 vuoden kokemus näyttelijänä ja ensimmäinen esitykseni oli 6-vuotiaana.</p>
    </div>
  </div>

  
      <div class="row">
	  
	  	<div class="col m5">
	  	<p>${tapahtuma.kuvaus } </p>
		</div>
		<div class="col m5">
		
		<table class="highlight centered responsive">
		<thead>
          <tr>
              <th data-field="osallistujat">Osallistujat</th>
          </tr>
        </thead>

        <tbody>
        <c:forEach items="${osallistujat}" var="kayttaja">
          <tr>
            <td>${kayttaja.etunimi}</td>
          </tr>
          </c:forEach>
        </tbody>
		</table>
		
		</div>
	 
	  <div class="col s12">
	   <form:form modelAttribute="kayttaja" action="osallistu/${tapahtuma.id}" method="post">
	  	<fieldset>
		  <form:input path="id" id="tapahtuman_id_jsp" type="hidden" name="iidee" value="<c:out value="'${tapahtuma.id}'"/>"/>
        <div class="input-field col sm2">
          <i class="material-icons prefix">account_circle</i>
          <form:input path="etunimi" id="icon_prefix" type="text" class="validate"/><form:errors path="etunimi"/>
          <form:label path="etunimi" for="icon_prefix">Etunimi</form:label>
        </div>
        <div class="input-field col sm2">
          <i class="material-icons prefix">account_circle</i>
          <form:input path="sukunimi" id="icon_prefix" type="text" class="validate"/><form:errors path="sukunimi"/>
          <form:label path="sukunimi" for="icon_prefix">Sukunimi</form:label>
        </div>
	   <div class="input-field col md3">
	      <i class="material-icons prefix">email</i>
          <form:input path="sposti" id="email" type="email" class="validate"/><form:errors path="sposti"/>
          <form:label path="sposti" for="email">Email</form:label>
        </div>
		<div class="input-field col md3">
	      <i class="material-icons prefix">phone</i>
          <form:input path="puh" id="phone" type="tel" class="validate"/><form:errors path="puh"/>
          <form:label path="puh" for="Puhelin">Puhelin</form:label>
        </div>
		<div class="input-field col md3">
		<button class="btn waves-effect indigo darken-4 waves-light" type="submit" name="action">Osallistu
		<i class="material-icons right">send</i>
		</button>
		</div>
		</fieldset>
		</form:form>
	  </div>
	  
	  <div class="divider"></div>
	  </div>
   
    
    </c:forEach> 
    
  </ul>

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