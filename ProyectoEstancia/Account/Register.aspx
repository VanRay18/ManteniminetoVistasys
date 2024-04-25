<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoEstancia.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
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
                background-color: #3498db;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                color: darkblue;
                margin-bottom: 4px; /* Espacio entre contenedores */
            }

            .row {
                max-width: 800px;
                margin: 0 auto;
                border-radius: 5px;
                padding: 10px;
                background-color: #2980b9; /* Color de fondo de los contenedores de filas */
                margin-bottom: 2px; /* Espacio entre filas */
            }

            .row label {
                color: #ffffff; /* Color de texto de las etiquetas */
            }

            .form-control {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: none;
                border-radius: 3px;
                background-color: #ffffff; /* Color de fondo de los campos de entrada */
            }

            /* Estilos para el botón de "Registrarse" */
            .btn-register {
                background-color: #6CA6CD; /* Color de fondo */
                color: #ffffff; /* Color del texto */
                padding: 10px 20px; /* Espaciado interno */
                border: none; /* Eliminamos el borde */
                border-radius: 5px; /* Bordes redondeados */
                cursor: pointer; /* Cursor al pasar */
                text-align: center; /* Centrar texto */
                text-decoration: none; /* Eliminar subrayado */
                display: inline-block; /* Mostrar como bloque en línea */
                font-size: 16px; /* Tamaño de fuente */
                transition: background-color 0.3s ease; /* Transición suave del color de fondo */
         
            }

            .btn-register:hover {
                background-color: #3498db; /* Color de fondo al pasar el mouse */
            }

        </style>
    </head>
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <h4>Crear una nueva cuenta</h4>
        <hr />
        
        <div class="container">
            <div class="row">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 col-form-label">Correo electrónico</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Contraseña</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" EnableViewState="true" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                    <asp:CustomValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage=""
                        OnServerValidate="PasswordValidator_ServerValidate" />
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label">Confirmar contraseña</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" EnableViewState="true" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="offset-md-2 col-md-10">
                <asp:Button runat="server" ID="btnRegister" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn-register" />
            </div>
        </div>
    </main>
</asp:Content>


