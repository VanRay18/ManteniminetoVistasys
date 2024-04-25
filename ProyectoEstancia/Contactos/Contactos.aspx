<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contactos.aspx.cs" Inherits="ProyectoEstancia.Contactos.Contactos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Aplicación - Contactos</title>
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
}

h2 {
    color: #3498db;
}

/* Estilo para la sección de contacto */
.contact {
    margin-bottom: 20px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    overflow: hidden;
    color: #f2f2f2; /* aliceblue */
}

.contact img {
    max-width: 100px;
    max-height: 100px;
    border-radius: 50%;
    margin-right: 20px;
    float: left;
}

.contact-info {
    float: left;
}

.contact-info h3 {
    margin: 0;
}

/* Estilo para la clase Grid */
.Grid {
    color: #f2f2f2; /* aliceblue */
}

    </style>
</head>




<body>
    <header>
        <h1>Vitasys</h1>
    </header>
    <div class="container">
        <h2>Contactos</h2>
        
        <div class="contact">
           
            <div class="contact-info">

               <h2>Agrega tu contacto de emergencia</h2>
        
           
                <div >
                    <asp:TextBox ID="txtNombre" runat="server" PlaceHolder="Nombre" Height="40px" Width="543px"></asp:TextBox>
                </div>
                <br>
                <div >
                    <asp:TextBox ID="txtCorreo" runat="server" PlaceHolder="Correo" Height="40px" Width="542px"></asp:TextBox>
                </div>
                <br>
                <div >
                    <asp:TextBox ID="txtTelefono" runat="server" PLaceHolder="Telefono" Height="40px" Width="541px"></asp:TextBox>
                </div>
                <br>
                <br>
             <div class="row">
                    <div class="col-md-4">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"    />
                    </div>
                      <div class="col-md-4">
                       <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"    />
                      </div>
                     <div class="col-md-4">
                         <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click"  />
                      </div>
            </div>
                
                
            </div>
        </div>
        <div class ="Grid">
            <asp:GridView ID="GridViewContacto" runat="server" Width="651px" AutoGenerateColumns="False" DataSourceID="SqlDataSourceContacto" OnSelectedIndexChanged="GridViewContacto_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button"></asp:CommandField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"></asp:BoundField>
                    <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo"></asp:BoundField>
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceContacto" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [Nombre], [Correo], [Telefono] FROM [Contacto]"></asp:SqlDataSource>
        </div>
 
   </div>


        
    


 </body>
</html>
</asp:Content>

