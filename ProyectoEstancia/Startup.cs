using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProyectoEstancia.Startup))]
namespace ProyectoEstancia
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
