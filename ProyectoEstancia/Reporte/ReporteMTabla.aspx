<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReporteMTabla.aspx.cs" Inherits="ProyectoEstancia.Reporte.ReporteMTabla" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Datos Médicos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
        }
         h5 {
            color: #4800ff;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #6bbef9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>

<body>
   <h1> REPORTE MÉDICO </h1>
    <h5> HISTORIAL SIGNOS VITALES</h5>

        <div>
          
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceReporte" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <%--<asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>--%>
                    <asp:BoundField DataField="Fecha" HeaderText="FECHA" SortExpression="fecha"></asp:BoundField>
                    <asp:BoundField DataField="Alertas" HeaderText="Alertas-Signos Vitales" SortExpression="alertas"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceReporte" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT id, fecha, alertas FROM ReporteMedico"></asp:SqlDataSource>
        
        </div>


   


     

</body>
</asp:Content>
