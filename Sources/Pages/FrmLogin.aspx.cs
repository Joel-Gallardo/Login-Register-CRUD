using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginRegistroCRUD.Sources.Pages
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        protected void Registrarse(Object sender, EventArgs e)
        {
            Response.Redirect("/Sources/Pages/FrmRegistro.aspx");
        }

        protected void IniciarSesion(Object sender, EventArgs e)
        {
            if (tbUsuario.Text == "" || tbClave.Text == "")
            {
                lblErrorLogin.Text = "Los campos no pueden quedar vacios";
            }
            else
            {
                string patron = "InfoToolsSV";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("validar", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = tbUsuario.Text;
                        cmd.Parameters.Add("@Clave", SqlDbType.VarChar).Value = tbClave.Text;
                        cmd.Parameters.Add("@Patron", SqlDbType.VarChar).Value = patron;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Session["usuariologueado"] = dr["Id"].ToString();
                            Response.Redirect("/Sources/Pages/FrmIndex.aspx");
                        }
                        else
                        {
                            lblErrorLogin.Text = "Usuario o contraseña incorrecta";
                        }
                        con.Close();
                    }
                }
            }
        }
    }
}