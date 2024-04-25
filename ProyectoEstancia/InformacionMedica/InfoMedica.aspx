<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InfoMedica.aspx.cs" Inherits="ProyectoEstancia.InformacionMedica.InfoMedica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Aplicación - Información Médica</title>
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
    color: #f2f2f2;
}

h2 {
    color: #3498db;
}

.medical-info {
    margin-bottom: 20px;
    color: #f2f2f2;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.edit-info {
    background-color: #3498db;
    color: #f2f2f2;
    border: none;
    padding: 8px 15px;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.edit-info:hover {
    background-color: #2980b9;
}

/* Evitar estilos directos en elementos genéricos como span */
.bold-text {
    font-weight: bold;
}

/* Estilo para la clase GridV */
.GridV {
    color: #f8f8ff; /* ghostwhite */
}

    </style>
</head>


<body>
    <header>
        <h1>Vitasys</h1>
    </header>
    <div class="container">
        <h2>Información Médica</h2>
        
        <div class="medical-info" id="patient-info">
            <p>NSS:</p> <asp:TextBox ID="txtNSS" runat="server" PlaceHolder=" NSS"></asp:TextBox>
            <p>Nombre completo:</p><asp:TextBox ID="txtNombre" runat="server" PlaceHolder=" Nombre" Width="627px"></asp:TextBox>
             <p>Edad:</p><asp:TextBox ID="txtEdad" runat="server" PlaceHolder=" Edad"></asp:TextBox>
            <p>Tipo de Sangre:</p>  <asp:TextBox ID="txtTipoSangre" runat="server" PlaceHolder=" Tipo de Sangre"></asp:TextBox>
            <p>Descripcion de enfermedad cronica:</p> <asp:TextBox ID="txtEnfermedad" runat="server" PlaceHolder="Descripcion de  Enfermedad" Height="150px" Width="633px"></asp:TextBox>
            <p>Medicamentos:</p> <asp:TextBox ID="txtMedicamentos" runat="server" PlaceHolder=" Medicamentos" Height="147px" Width="631px"></asp:TextBox>
        </div>

        <div class="row">

            <div class="col-md-4">
                <asp:Button ID="btnInsertar" runat="server" Text="Guardar" OnClick="btnInsertar_Click1"   />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"  />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click"   />
            </div>
            
        </div>
        <br>
        <br>

        <div class: "GridV">
            <asp:GridView ID="GridViewInfoMedica" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceInfoMedica" OnSelectedIndexChanged="GridViewInfoMedica_SelectedIndexChanged" Height="84px" Width="711px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="button"></asp:CommandField>
                    <asp:BoundField DataField="NSS" HeaderText="NSS" SortExpression="NSS"></asp:BoundField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"></asp:BoundField>
                    <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad"></asp:BoundField>
                    <asp:BoundField DataField="TipoSangre" HeaderText="TipoSangre" SortExpression="TipoSangre"></asp:BoundField>
                    <asp:BoundField DataField="Enfermedad" HeaderText="Enfermedad" SortExpression="Enfermedad"></asp:BoundField>
                    <asp:BoundField DataField="Medicamentos" HeaderText="Medicamentos" SortExpression="Medicamentos"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceInfoMedica" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [NSS], [Nombre], [Edad], [TipoSangre], [Enfermedad], [Medicamentos] FROM [InformacionMedica]"></asp:SqlDataSource>
        </div>

    </div> 
</body>




</html>
</asp:Content>

