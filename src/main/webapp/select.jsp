<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit&family=Mukta:wght@500;700&display=swap" rel="stylesheet">
    <link href="css/tabellaBella.css" rel="stylesheet">
    <link rel="icon" href="img/unnamed.png">

    <title>Visualizza</title>
</head>

<body style="background-color: white;">

    <nav class="navbar navbar-expand-lg" style="background-color: rgba(0, 101, 184, 0.952); color: white;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">   </a>
            <button  class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa-solid fa-bars iconcina"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="home.jsp">HOME</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp">INSERISCI</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link act" href="Select">VISUALIZZA</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="legenda()">LEGENDA COLORI</a>
                    </li>
                </ul>
                <form class="d-flex position-absolute end-0" role="search" action="Select" method="GET" style="margin-right:5px;">
      				<input class="form-control me-2" name="nome" type="search" placeholder="Nome" aria-label="Search">
      				<input class="form-control me-2" name="cognome" type="search" placeholder="Cognome" aria-label="Search">
      				<button class="btn btn-outline-light" type="submit">Cerca</button>
    			</form>
            </div>
        </div>
    </nav>
    
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
                
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
                
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        
        .close:hover,
        .close:focus {
            color: #000;
                text-decoration: none;
            cursor: pointer;
        }

        .nav-link{
            color: white;
            font-weight: bold;
            margin-right: 15px;
        }
     
        .nav-link:hover{
            color: rgba(99, 166, 220, 0.952);
        }
     
       .act{
            color: rgb(0, 140, 255);;
        }
        .iconcina{
            color: white;
        }
        
        .dot {
		    height: 25px;
		    width: 25px; 
		    border-radius: 50%;
		    display: inline-block;
		  }
    </style>
</head>

<body>
                	
	 <div id="no-more-tables" class="container text-center" style="margin-top: 30px;">
	    <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
	        <thead>
	            <tr>
	                <th scope="col">Nome</th>
	                <th scope="col">Cognome</th>
	                <th scope="col">Eta</th>
	                <th scope="col">Candidatura</th>
	                <th scope="col">Esito</th>
	                <th scope="col">Dettagli</th>
	                <th scope="col">Elimina</th>
	                <th scope="col">Modifica</th>
	            </tr>
	        </thead>
	        
	        <tbody>
	            <c:forEach items="${listacandidati}" var="listacandidati">
	                <tr>
	                    <td data-title="Nome">${listacandidati.nome}</td>
	                    <td data-title="Cognome">${listacandidati.cognome}</td>
	                    <td data-title="Eta">${listacandidati.eta}</td>
	                    <td data-title="Candidatura">${listacandidati.data_candidatura}</td>
	                    
	                    <c:if test="${listacandidati.esito == 'Idoneo'}">
							<td data-title="Esito"><span class="dot" id="esitoPalla" style="background-color: green"></span></td>
						</c:if>

						<c:if test="${listacandidati.esito == 'Non Idoneo'}">
							<td data-title="Esito"><span class="dot" id="esitoPalla" style="background-color: red"></span></td>	
						</c:if>
	
						<c:if test="${listacandidati.esito == 'In attesa'}">
							<td data-title="Esito"><span class="dot" id="esitoPalla" style="background-color: yellow"></span></td>
						</c:if>
	
						<c:if test="${listacandidati.esito == 'Da ricontattare'}">
							<td data-title="Esito"><span class="dot" id="esitoPalla" style="background-color: blue"></span></td>
						</c:if>
	                    
	                    <td data-title="Dettagli"><a href="AppoggioDettaglio?id=${listacandidati.id}&nome=${listacandidati.nome}&cognome=${listacandidati.cognome}&anno_nascita=${listacandidati.anno_nascita}&eta=${listacandidati.eta}&residenza=${listacandidati.residenza}&telefono=${listacandidati.telefono}&email=${listacandidati.email}&titolo_studio=${listacandidati.titolo_studio}&voto=${listacandidati.voto}&formazione=${listacandidati.formazione}&data_candidatura=${listacandidati.data_candidatura}&data_colloquio=${listacandidati.data_colloquio}&note=${listacandidati.note}&esito=${listacandidati.esito}&greenpass=${listacandidati.greenpass}">
	                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ModeButton">Dettagli</button>
	                        </a>
	                    </td>
	                    
	                    <td data-title="Elimina">
	                        <form action="Delete" method="post">
	                            <input type="hidden" name="id" id="id" value="${listacandidati.id}" />
	                            <button class="btn btn-danger" type="submit">Elimina</button>
	                        </form>
	                    </td>
	                        
	                        <td data-title="Modifica"><a href="Update?id=${listacandidati.id}&nome=${listacandidati.nome}&cognome=${listacandidati.cognome}&anno_nascita=${listacandidati.anno_nascita}&eta=${listacandidati.eta}&residenza=${listacandidati.residenza}&telefono=${listacandidati.telefono}&email=${listacandidati.email}&titolo_studio=${listacandidati.titolo_studio}&voto=${listacandidati.voto}&formazione=${listacandidati.formazione}&data_candidatura=${listacandidati.data_candidatura}&data_colloquio=${listacandidati.data_colloquio}&note=${listacandidati.note}&esito=${listacandidati.esito}&greenpass=${listacandidati.greenpass}">
	                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModeButton">Modifica</button>
	                            </a>
	                        </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">Cognome</th>
                        <th scope="col">Eta</th>
                        <th scope="col">Formaz</th>
                        <th scope="col">Candidatura</th>
                        <th scope="col">Greenpass</th>
                        <th scope="col">Dettagli</th>
                        <th scope="col">Elimina</th>
                        <th scope="col">Modifica</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listacandidati}" var="listacandidati">
                        <tr>
                            <td>${listacandidati.nome}</td>
                            <td>${listacandidati.cognome}</td>
                            <td>${listacandidati.eta}</td>
                            <td>${listacandidati.formazione}</td>
                            <td>${listacandidati.data_candidatura}</td>
                            <td>${listacandidati.greenpass}</td>
                            <td><button type="button" class="btn btn-success" id="myBtn">Dettagli</button></td>
                            <td>
                                <form action="Delete" method="post">
                                    <input type="hidden" name="IdU" id="IdU" value="${list.id}" />
                                    <button class="btn btn-danger" type="submit">Elimina</button>
                                </form>
                            </td>
                            <td><a href="Update?id=${list.id}&nome=${list.nome}&cognome=${list.cognome}&eta=${list.eta}">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModeButton">Modifica</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


    <script>
        var modal = document.getElementById("myModal");
        var btn = document.getElementById("myBtn");
        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
                
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/c2b8bef5f3.js" crossorigin="anonymous"></script>
    <script src="js/sweetalert2.all.js"></script>
    <script src="js/script.js"></script>
</body>
</html>