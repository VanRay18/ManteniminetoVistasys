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
            string SQLServer_Conection_String = "Data Source=MSI\SQLEXPRESS;Initial Catalog=VITASYS;Integrated Security=True";
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
                string sql = "INSERT INTO [dbo].[InformacionMedica] ([NSS],[Nombre],[Edad],[TipoSangre],[Enfermedad],[Medicamentos]) VALUES (@NSS, @Nombre, @Edad, @TipoSangre, @Enfermedad, @Medicamentos)";
                using (SqlConnection conexion = new SqlConnection(Get_ConectionString()))
                {
                    using (SqlCommand mycmd = new SqlCommand(sql, conexion))
                    {
                        mycmd.Parameters.AddWithValue("@NSS", txtNSS.Text);
                        mycmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                        mycmd.Parameters.AddWithValue("@Edad", txtEdad.Text);
                        mycmd.Parameters.AddWithValue("@TipoSangre", txtTipoSangre.Text);
                        mycmd.Parameters.AddWithValue("@Enfermedad", txtEnfermedad.Text);
                        mycmd.Parameters.AddWithValue("@Medicamentos", txtMedicamentos.Text);

                        conexion.Open();
                        mycmd.ExecuteNonQuery();
                    }
                }
                BorrarTxt();
                GridViewInfoMedica.DataBind();
                SqlDataSourceInfoMedica.DataBind();
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "UPDATE [dbo].[InformacionMedica] SET [NSS] = @NSS, [Nombre] = @Nombre, [Edad] = @Edad, [TipoSangre] = @TipoSangre, [Enfermedad] = @Enfermedad, [Medicamentos] = @Medicamentos WHERE [NSS] = @NSS";
                using (SqlConnection conexion = new SqlConnection(Get_ConectionString()))
                {
                    using (SqlCommand mycmd = new SqlCommand(sql, conexion))
                    {
                        mycmd.Parameters.AddWithValue("@NSS", txtNSS.Text);
                        mycmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                        mycmd.Parameters.AddWithValue("@Edad", txtEdad.Text);
                        mycmd.Parameters.AddWithValue("@TipoSangre", txtTipoSangre.Text);
                        mycmd.Parameters.AddWithValue("@Enfermedad", txtEnfermedad.Text);
                        mycmd.Parameters.AddWithValue("@Medicamentos", txtMedicamentos.Text);

                        conexion.Open();
                        mycmd.ExecuteNonQuery();
                    }
                }
                BorrarTxt();
                GridViewInfoMedica.DataBind();
                SqlDataSourceInfoMedica.DataBind();
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
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
                string sql = "DELETE FROM [dbo].[InformacionMedica] WHERE [NSS] = @NSS";
                using (SqlConnection conexion = new SqlConnection(Get_ConectionString()))
                {
                    using (SqlCommand mycmd = new SqlCommand(sql, conexion))
                    {
                        mycmd.Parameters.AddWithValue("@NSS", txtNSS.Text);

                        conexion.Open();
                        mycmd.ExecuteNonQuery();
                    }
                }
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