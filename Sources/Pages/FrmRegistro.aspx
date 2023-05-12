<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmRegistro.aspx.cs" Inherits="LoginRegistroCRUD.Sources.Pages.FrmRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <%--bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="../JavaScript/script.js"></script>
    <title>Registro de usuarios</title>
</head>
<body>
    <form id="FrmRegistro" runat="server">
        <div class="container d-flex justify-content-center">
            <div class="col-8">
                <div class="form-control card card-body">
                    <div class="row justify-content-center">
                        <asp:Label runat="server" CssClass="row justify-content-center h3"></asp:Label>
                    </div>
                    <fieldset>
                        <legend class="row justify-content-center">Datos personales</legend>
                        <div class="input-group">
                            <asp:Label ID="lablel1" runat="server" CssClass="form-control" Text="Nombres"></asp:Label>
                            <asp:TextBox ID="tbNombres" runat="server" CssClass="form-control" placeholder="Ej. Joel"></asp:TextBox>
                        </div>
                        <br />
                        <div class="input-group">
                            <asp:Label ID="lablel2" runat="server" CssClass="form-control" Text="Apellidos"></asp:Label>
                            <asp:TextBox ID="tbApellidos" runat="server" CssClass="form-control" placeholder="Ej. Gallardo"></asp:TextBox>
                        </div>
                        <br />
                        <div class="input-group">
                            <asp:Label ID="lablel3" runat="server" CssClass="form-control" Text="Fecha de nacimiento"></asp:Label>
                            <asp:TextBox ID="tbFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </fieldset>
                    <br />
                    <fieldset>
                        <legend>Datos de inicio de sesion</legend>
                        <div class="input-group">
                            <asp:Label ID="Label4" runat="server" CssClass="form-control" Text="Usuario:"></asp:Label>
                            <asp:TextBox ID="tbUsuario" runat="server" CssClass="form-control" placeholder="Ej. Joel123"></asp:TextBox>
                        </div>
                        <br />
                        <div class="input-group">
                            <asp:Label ID="Label5" runat="server" CssClass="form-control" Text="Password:"></asp:Label>
                            <asp:TextBox ID="tbClave" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <br />
                       <div class="input-group">
                            <asp:Label ID="Label6" runat="server" CssClass="form-control" Text="Repetir Password:"></asp:Label>
                            <asp:TextBox ID="tbClave2" runat="server" CssClass="form-control" placeholder="Repetir Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <br />
                        <div class="row justify-content-center">
                            <asp:Image runat="server" CssClass="img-thumbnail" width="150" Height="150" ImageUrl="~/Sources/Images/profile-icon.jpg"></asp:Image>
                        </div>
                        <div class="row justify-content-center">
                            <asp:FileUpload runat="server" CssClass="small form-control" ID="FUImage" onchange="mostrarimagen(this)"/>
                        </div>
                    </fieldset>
                    <br />
                    <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    <br />
                    <div class="row">
                        <asp:Button runat="server" CssClass="form-control btn btn-success" Text="Completar Registro"  OnClick="Registrar"/>
                        <hr />
                        <asp:Button runat="server" CssClass="form-control btn btn-warning" Text="Cancelar" OnClick="Cancelar"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
