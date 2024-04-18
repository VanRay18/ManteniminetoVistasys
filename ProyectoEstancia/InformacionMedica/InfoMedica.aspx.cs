using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEstancia.InformacionMedica
{
    public partial class InfoMedica : System.Web.UI.Page
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
            txtNSS.Text = "";
            txtNombre.Text = "";
            txtEdad.Text = "";
            txtTipoSangre.Text = "";
            txtEnfermedad.Text = "";
            txtMedicamentos.Text = "";
           
        }

     

        protected void btnInsertar_Click1(object sender, EventArgs e)
        {
            try
            {
                string sql;
                SqlCommand mycmd = new SqlCommand();
                SqlDataReader reader;
                SqlConnection conexion = new SqlConnection(Get_ConectionString());
                conexion.Open();
                sql = "INSERT INTO [dbo].[InformacionMedica] ([NSS],[Nombre],[Edad],[TipoSangre],[Enfermedad],[Medicamentos]) VALUES('" + txtNSS.Text + " ','" + txtNombre.Text + " ','" + txtEdad.Text + "','" + txtTipoSangre.Text + "','" + txtEnfermedad.Text + "','" + txtMedicamentos.Text + "')";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewInfoMedica.DataBind();
                SqlDataSourceInfoMedica.DataBind();
            }
            catch (Exception ex)
            {

            }
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
                sql = "UPDATE [dbo].[InformacionMedica] SET [NSS] ='" + txtNSS.Text + "' ,[Nombre] ='" + txtNombre.Text + "',[Edad] ='" + txtEdad.Text + "',[TipoSangre] ='" + txtTipoSangre.Text + "' ,[Enfermedad] ='" + txtEnfermedad.Text + "' ,[Medicamentos] ='" + txtMedicamentos.Text + "' WHERE [NSS] = '" + txtNSS.Text + "'";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewInfoMedica.DataBind();
                SqlDataSourceInfoMedica.DataBind();
              
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridViewInfoMedica_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNSS.Text = GridViewInfoMedica.SelectedRow.Cells[1].Text.ToString();
            txtNombre.Text = GridViewInfoMedica.SelectedRow.Cells[2].Text.ToString();
            txtEdad.Text = GridViewInfoMedica.SelectedRow.Cells[3].Text.ToString();
            txtTipoSangre.Text = GridViewInfoMedica.SelectedRow.Cells[4].Text.ToString();
            txtEnfermedad.Text = GridViewInfoMedica.SelectedRow.Cells[5].Text.ToString();
            txtMedicamentos.Text = GridViewInfoMedica.SelectedRow.Cells[6].Text.ToString();
           
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
                sql = "DELETE FROM [dbo].[InformacionMedica] WHERE [NSS] = '" + txtNSS.Text + "' ";
                mycmd.CommandText = sql;
                mycmd.Connection = conexion;
                reader = mycmd.ExecuteReader();
                conexion.Close();
                BorrarTxt();
                GridViewInfoMedica.DataBind();
                SqlDataSourceInfoMedica.DataBind();


            }
            catch (Exception ex)
            {
                // Manejo de excepciones
            }
        }
    }
}