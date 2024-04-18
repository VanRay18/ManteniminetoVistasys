using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEstancia.Contactos
{
    public partial class Contactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string Get_ConectionString()
        {
            string SQLServer_Conection_String = "Data Source=ROSE\\SQLEXPRESS; Initial Catalog=bddatos; User ID= sa; Password=aaa";
            return SQLServer_Conection_String;
        }
        public void BorrarTxt()
        {
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql;
                SqlCommand mycmd = new SqlCommand();
                SqlDataReader reader;
                SqlConnection conexion = new SqlConnection(Get_ConectionString());
                conexion.Open();
                sql = "INSERT INTO [dbo].[Contacto] ([Nombre],[Correo],[Telefono]) VALUES('" + txtNombre.Text + " ','" + txtCorreo.Text + " ','" + txtTelefono.Text + "')";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewContacto.DataBind();
                SqlDataSourceContacto.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

       

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "";
                SqlCommand mycmd = new SqlCommand();
                SqlDataReader reader;
                SqlConnection conexion = new SqlConnection(Get_ConectionString());
                conexion.Open();
                sql = "DELETE FROM [dbo].[Contacto] WHERE [Nombre] = '" + txtNombre.Text + "' ";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewContacto.DataBind();
                SqlDataSourceContacto.DataBind();

            }
            catch (Exception ex)
            {
                // Manejo de excepciones
            }
        }

        protected void GridViewContacto_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNombre.Text = GridViewContacto.SelectedRow.Cells[1].Text.ToString();
            txtCorreo.Text = GridViewContacto.SelectedRow.Cells[2].Text.ToString();
            txtTelefono.Text = GridViewContacto.SelectedRow.Cells[3].Text.ToString();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql;
                SqlCommand mycmd = new SqlCommand();
                SqlDataReader reader;
                SqlConnection conexion = new SqlConnection(Get_ConectionString());
                conexion.Open();
                sql = "UPDATE [dbo].[Contacto] SET [Nombre] ='" + txtNombre.Text + "' ,[Correo] ='" + txtCorreo.Text + "',[Telefono] ='" + txtTelefono.Text + "' WHERE [Nombre] = '" + txtNombre.Text + "'";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewContacto.DataBind();
                SqlDataSourceContacto.DataBind();
            }
            catch (Exception ex)
            {

            }

        }
    }
    }

