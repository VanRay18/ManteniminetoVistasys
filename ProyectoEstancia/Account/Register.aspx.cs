using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ProyectoEstancia.Models;
using System.Web.UI.WebControls;


namespace ProyectoEstancia.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };

            // Guardar temporalmente los valores de contraseña y confirmación de contraseña
            string passwordValue = Password.Text;
            string confirmPasswordValue = ConfirmPassword.Text;

            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                // Construir el mensaje de error dinámicamente
                string errorMessage = "";

                if (Password.Text.Length < 8)
                {
                    errorMessage += "Mínimo 8 caracteres. ";
                }

                if (!Password.Text.Any(char.IsUpper))
                {
                    errorMessage += "Falta una mayúscula. ";
                }

                if (!Password.Text.Any(char.IsDigit))
                {
                    errorMessage += "Falta un número. ";
                }

                if (!Password.Text.Any(c => !char.IsLetterOrDigit(c)))
                {
                    errorMessage += "Falta un símbolo especial. ";
                }

                ErrorMessage.Text = errorMessage;
               
            }

        }


        protected void PasswordValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string password = args.Value;

            // Verificar cada requisito y establecer el resultado de la validación
            args.IsValid = password.Length >= 8 && password.Any(char.IsUpper) && password.Any(char.IsDigit) && password.Any(c => !char.IsLetterOrDigit(c));
        }
    }
}

