<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoEstancia.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PaginaVitaSys</title>
        <style>
            /* Estilos de la págia */
            body {
                font-family: 'Roboto', sans-serif; /* Cambios de la fuente */
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
                margin: 50px auto; /* Centrar verticalmente y horizontalmente */
                padding: 20px;
                background-color: #3498db; /* Color de fondo del contenedor */
                border-radius: 5px; /* Bordes redondeados */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Sombra */
                color: darkblue; /* Color del texto */
            }

            .row {
                margin-bottom: 10px; /* Espacio entre filas */
            }

            .col-form-label {
                color: #ffffff; /* Color de las etiquetas */
            }

            .form-control {
                width: 100%;
                padding: 10px;
                border: none; /* Borde del campo de entrada */
                border-radius: 3px; /* Bordes redondeados */
                background-color: #ffffff; /* Color de fondo del campo de entrada */
                margin-bottom: 10px; /* Espacio inferior */
                box-sizing: border-box;
            }

            /* Estilos para el checkbox */
            .checkbox label {
                color: ghostwhite; /* Color del texto de la casilla de verificación */
                font-size: 14px; /* Tamaño de fuente */
            }

            .checkbox input[type="checkbox"] {
                width: 16px; /* Ancho del checkbox */
                height: 16px; /* Altura del checkbox */
                margin-right: 5px; /* Espacio entre el checkbox y el texto */
                vertical-align: middle; /* Alineación vertical */
            }

            .btnLogin {
                background-color: #0b1b4a; /* Color de fondo del botón */
                color: ghostwhite; /* Color del texto del botón */
                padding: 5px; /* Espaciado interno */
                border: none; /* Eliminamos el borde */
                border-radius: 5px; /* Bordes redondeados */
                cursor: pointer; /* Cursor al pasar */
                text-align: center; /* Centrar texto */
                text-decoration: none; /* Eliminar subrayado */
                display: inline-block; /* Mostrar como bloque en línea */
                font-size: 16px; /* Tamaño de fuente */
                transition: background-color 0.3s ease; /* Transición suave del color de fondo */
            }

            .btnLogin:hover {
                background-color: #08518c; /* Cambio de color al pasar el mouse */
            }

            .socialLoginForm {
                text-align: center; /* Alinear al centro */
            }

            /* Estilos para el pie de página */
            .footer {
                text-align: center; /* Alinear al centro */
                margin-top: 5px; /* Espacio superior */
                color: #666666; /* Color del texto del pie de página */
            }

            .footer a {
                color: #3498db; /* Color del enlace en el pie de página */
                text-decoration: none; /* Eliminar subrayado */
            }

            .footer a:hover {
                text-decoration: underline; /* Subrayado al pasar el ratón */
            }

        </style>
    </head>
    <main aria-labelledby="title">
        <h2 id="title" class="text-center"><%: Title %></h2> <!-- Centro el título -->
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <section id="loginForm">
                        <div class="row">
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Correo electrónico" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Contraseña" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-md-2 col-md-10 checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" CssClass="checkbox" />
                                    <asp:Label runat="server" AssociatedControlID="RememberMe">¿Recordar cuenta?</asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-md-2 col-md-10">
                                    <asp:Button runat="server" ID="btnLogin" OnClick="LogIn" Text="Iniciar sesión" CssClass="btnLogin" />
                                </div>
                            </div>
                        </div>
                        <p>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse</asp:HyperLink>
                        </p>
                    </section>
                </div>
                <div class="col-md-4">
                    <section id="socialLoginForm" class="socialLoginForm">
                        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                    </section>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
