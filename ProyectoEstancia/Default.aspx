<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoEstancia._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <main>
        <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PaginaVitaSys</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #3498db;
            color: #f2f2f2;
            text-align: center;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #0b1b4a;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            color: darkblue
        }
        .row {
            max-width: 800px;
            max-height: 800px;
            border-radius: 50%;
            margin-right: 20px;

        }

        #main{
           
            background-color: #0b1b4a;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
    
    </style>
</head>
        <container>
            <section class="row" aria-labelledby="aspnetTitle">
            <div class="card mb-4">
              <img src="Principal2/proyectorose/img/cora.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">VITASYS</h5>
                <p class="card-text">Las Enfermedades No Transmisibles (ENT) constituyen una de las principales
                                        causas de morbilidad, discapacidad y mortalidad en todo el mundo. Existen
                                        múltiples personas que padecen de enfermedades crónicas, al año estas
                                        enfermedades son responsables de 41 millones de muertes a nivel mundial; lo que
                                        las sitúa como la principal causa de muerte y discapacidad en el mundo..</p>
                <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
              </div>
        </div>
            
        </section>


            <div class="card-group">
              <div class="card">          
                 <img src="Principal2/proyectorose/img/Vitales.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">¿Qué hace VitaSys?</h5>
                  <p class="card-text">Monitorear signos vitales a través de una aplicación que pueda otorgar un diagnóstico constante sobre los síntomas de cadausuario.</p>
                  <%--<p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>--%>
                </div>
              </div>
              <div class="card">
                <img src="Principal2/proyectorose/img/logo.png" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">¿Cómo lo  hace VitaSys?</h5>
                  <p class="card-text">Mediante un reloj inteligente, este dispositivo se encarga de supervisar constantemente los signos vitales de las personas, y proporciona alarmas cuando los signos son inestables.</p>
                  <%--<p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>--%>
                </div>
              </div>
              <div class="card">
                 <img src="Principal2/proyectorose/img/fondosignosvitales.png" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Objetivo</h5>
                  <p class="card-text">Tiene el objetivo de reducir el índice de muertes de dichas enfermedades no terminales , y mejorar la vida de las personas que padecen algun tipo de enfermedad no trasmisible. </p>
                  <%--<p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>--%>
                </div>
              </div>
            </div>


      
        </container>
        
    </main>



</asp:Content>
