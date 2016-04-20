/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: Luis Lazaro
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Negocio;

namespace SaludDeAceroChecador
{
    public partial class FormChecador : Form
    {
        /// <summary>
        /// Constructor del Form
        /// </summary>
        public FormChecador()
        {
            InitializeComponent();

        }

        /// <summary>
        /// Evento defaul para carga del form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FormChecador_Load(object sender, EventArgs e)
        {
            limpiaCampos();
        }

        /// <summary>
        /// Crea el Formulario de Busqueda de Usuario
        /// </summary>
        public void CreaFormBuscar()
        {
            // Create a new instance of the form.
            Form formBusqueda = new Form();
            // Create two buttons to use as the accept and cancel buttons.
            Button btnBuscar = new Button();
            Button btnCancelar = new Button();
            TextBox txtBuscar = new TextBox();
            Label lblNombre = new Label();
            Label lblClave = new Label();
            PictureBox pbImage = new PictureBox();

            // Set the position  on the form.
            lblNombre.Location = new Point(30, 50);
            lblNombre.Size = new System.Drawing.Size(190, 20);
            //Text
            lblNombre.Text = "Introduce tu nombre";
            //Font
            lblNombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // Set the position  on the form.
            lblClave.Location = new Point(120, 240);
            lblClave.Size = new System.Drawing.Size(190, 20);
            //Console.WriteLine(System.Windows.Forms.Application.StartupPath.Replace("\\bin\\Debug", "\\Imagen\\usuario.png"));
            Image image = Image.FromFile(System.Windows.Forms.Application.StartupPath.Replace("\\bin\\Debug", "\\Imagen\\usuario.png"));
            // Set the position  on the form.
            pbImage.Location = new Point(10, 60);
            pbImage.Size = new System.Drawing.Size(250, 180);
            pbImage.Image = image;
            //Text
            lblClave.Text = "Clave:";
            //Font
            lblClave.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // Set the position  on the form.
            txtBuscar.Location = new Point(10, 20);
            //Set Size
            txtBuscar.Size = new System.Drawing.Size(180, 20);
            //Font
            txtBuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // Set the text of button1 to "OK".
            btnBuscar.Text = "Buscar Clave:";
            // Set the position of the button on the form.
            btnBuscar.Location = new Point(200, 20);
            // Set the text of button2 to "Cancel".
            btnCancelar.Text = "Cancelar";
            // Set the position of the button based on the location of button1.
            btnCancelar.Location = new Point(120, 200);
            // Set the caption bar text of the form.   
            formBusqueda.Text = "Consulta de Clave";
            // Display a help button on the form.
            formBusqueda.HelpButton = true;
            // Define the border style of the form to a dialog box.
            formBusqueda.FormBorderStyle = FormBorderStyle.FixedDialog;
            // Set the MaximizeBox to false to remove the maximize box.
            formBusqueda.MaximizeBox = false;
            // Set the MinimizeBox to false to remove the minimize box.
            formBusqueda.MinimizeBox = false;
            // Set the accept button of the form to button1.
            formBusqueda.AcceptButton = btnBuscar;
            // Set the cancel button of the form to button2.
            formBusqueda.CancelButton = btnCancelar;
            // Set the start position of the form to the center of the screen.
            formBusqueda.StartPosition = FormStartPosition.CenterScreen;
            //BackGround Color
            formBusqueda.BackColor = Color.White;
            // Add button1 to the form.
            formBusqueda.Controls.Add(btnBuscar);
            // Add button2 to the form.
            //formBusqueda.Controls.Add(btnCancelar);
            // Add TextBox to the form.
            formBusqueda.Controls.Add(txtBuscar);
            formBusqueda.Controls.Add(lblNombre);
            formBusqueda.Controls.Add(lblClave);
            formBusqueda.Controls.Add(pbImage);
            // Display the form as a modal dialog box.
            formBusqueda.ShowDialog();
        }

        /// <summary>
        /// Crea el Formulario para la busqueda del Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lnkBtnUsuarios_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            CreaFormBuscar();
        }

        /// <summary>
        /// Evento que dispara el guardado de la asistencia del empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void txtxClave_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Return)
            {
                if (Validate())
                {
                    if (chkSocios.Checked == true)
                    {
                        try
                        {
                            Socios();
                            chkSocios.Checked = true;
                        }
                        catch (Exception)
                        {
                            lblError.Text = "Error:Verifica que el numero ingresado pertenezca a un Socio y no a un Empleado....";
                            lblError.Visible = true;
                        }
                    }
                    else
                    {
                        try
                        {
                            Empleados();
                            chkSocios.Checked = true;
                        }
                        catch (Exception)
                        {
                            lblError.Text = "Error:Verifica que el numero ingresado pertenezca a un Empleado (esté dado de alta) y no a un Socio....";
                            lblError.Visible = true;
                        }
                    }
                    pausa(5000);
                    limpiaCampos();
                }
            }
        }

        /// <summary>
        /// Guarda el checador de los socios
        /// </summary>
        public void Socios()
        {
            N_Socio objSocio = new N_Socio();
            N_ChecadorSocio objChec = new N_ChecadorSocio();

            DataSet obj = objSocio.getSociosGrid();
            DataSet objExiste = objChec.getChecadorSocioByNumero(Convert.ToInt32(txtxClave.Text));
            bool bandera = false;
            if (objExiste.Tables[0].Rows.Count >= 1)
            {
                objChec.updtChecadorSocios(objExiste.Tables[0].Rows[0]["id_entrada_salida"].ToString(), objExiste.Tables[0].Rows[0]["id_socio"].ToString(), objExiste.Tables[0].Rows[0]["entrada"].ToString(), System.DateTime.Now.ToString(), objExiste.Tables[0].Rows[0]["activo"].ToString());
                bandera = true;
            }
            else { objChec.addChecadorSocios(txtxClave.Text); }

            foreach (DataRow temp in obj.Tables[0].Rows)
            {
                if (Convert.ToInt32(temp["num_socio"].ToString()) == Convert.ToInt32(txtxClave.Text))
                {
                    imgSocio.Visible = true;
                    lblBienvenidos.Visible = true;
                    lblDias.Visible = true;
                    lblNombre.Visible = true;
                    lblSetDias.Visible = true;
                    lblSetNombreSocio.Visible = true;
                    lblEntrada.Visible = true;
                    lblHoraEntrada.Visible = true;
                    lblSalida.Visible = true;
                    lblHoraSalida.Visible = true;
                    lblSetNombreSocio.Text = temp["nombre"].ToString() + "" + temp["ap_paterno"].ToString() + " " + temp["ap_Materno"].ToString();
                    lblSetDias.Text = objChec.VerificaVisitas(Convert.ToInt32(txtxClave.Text)).ToString();
                    Image image = Image.FromFile(System.Windows.Forms.Application.StartupPath.Replace("\\bin\\Debug", "\\fotos\\" + txtxClave.Text + ".jpg"));
                    // Set the position  on the form.
                    //imgSocio.Location = new Point(10, 60);
                    imgSocio.SizeMode = PictureBoxSizeMode.StretchImage;
                    //imgSocio.Size = new System.Drawing.Size(250, 180);
                    imgSocio.Image = image;
                    if (bandera)
                    {
                        lblEntrada.Text = objExiste.Tables[0].Rows[0]["entrada"].ToString();
                        lblSalida.Text = System.DateTime.Now.ToString();
                    }
                    else { lblEntrada.Text = System.DateTime.Now.ToString(); }
                    break;
                }
            }
            pausa(5000);
            limpiaCampos();

        }
        /// <summary>
        /// Guarda el checador de los empleados
        /// </summary>
        public void Empleados()
        {
            N_Empleados objEmpleado = new N_Empleados();
            N_Checador objChec = new N_Checador();

            DataSet obj = objEmpleado.getEmpleadosGrid();
            DataSet objExiste = objChec.getChecadorByNumero(Convert.ToInt32(txtxClave.Text));
            bool bandera = false;
            if (objExiste.Tables[0].Rows.Count >= 1)
            {
                objChec.updtChecadors(objExiste.Tables[0].Rows[0]["id_entrada_salida"].ToString(), objExiste.Tables[0].Rows[0]["id_empleado"].ToString(), objExiste.Tables[0].Rows[0]["entrada"].ToString(), System.DateTime.Now.ToString(), objExiste.Tables[0].Rows[0]["activo"].ToString());
                bandera = true;
            }
            else { objChec.addChecadors(txtxClave.Text); }

            foreach (DataRow temp in obj.Tables[0].Rows)
            {
                if (Convert.ToInt32(temp["num_empleado"].ToString()) == Convert.ToInt32(txtxClave.Text))
                {
                    imgSocio.Visible = true;
                    lblBienvenidos.Visible = true;
                    lblDias.Visible = true;
                    lblNombre.Visible = true;
                    lblSetDias.Visible = true;
                    lblSetNombreSocio.Visible = true;
                    lblEntrada.Visible = true;
                    lblHoraEntrada.Visible = true;
                    lblSalida.Visible = true;
                    lblHoraSalida.Visible = true;
                    lblSetNombreSocio.Text = temp["nombre"].ToString() + "" + temp["ap_paterno"].ToString() + " " + temp["ap_Materno"].ToString();
                    lblSetDias.Text = "";
                    Image image = Image.FromFile(System.Windows.Forms.Application.StartupPath.Replace("\\bin\\Debug", "\\fotosEmpleados\\" + txtxClave.Text + ".jpg"));
                    // Set the position  on the form.
                    //imgSocio.Location = new Point(10, 60);
                    imgSocio.SizeMode = PictureBoxSizeMode.StretchImage;
                    //imgSocio.Size = new System.Drawing.Size(250, 180);
                    imgSocio.Image = image;
                    if (bandera)
                    {
                        lblEntrada.Text = objExiste.Tables[0].Rows[0]["entrada"].ToString();
                        lblSalida.Text = System.DateTime.Now.ToString();
                    }
                    else { lblEntrada.Text = System.DateTime.Now.ToString(); }
                    break;
                }
            }
            pausa(5000);
            limpiaCampos();

        }

        /// <summary>
        /// Limpia los campos
        /// </summary>
        public void limpiaCampos()
        {
            lblBienvenidos.Visible = false;
            lblDias.Visible = false;
            lblNombre.Visible = false;
            lblSetDias.Visible = false;
            lblSetNombreSocio.Visible = false;
            txtxClave.Text = "";
            imgSocio.Visible = false;
            lblEntrada.Visible = false;
            lblHoraEntrada.Visible = false;
            lblSalida.Visible = false;
            lblHoraSalida.Visible = false;
            lblError.Visible = false;
            lblError.ForeColor = Color.DarkRed;
        }

        public void pausa(int pSegundos)
        {
            int vInicio = Environment.TickCount;
            while ((Environment.TickCount - vInicio) <= pSegundos)
            {
                Application.DoEvents();
            }
        }

        /// <summary>
        /// Valida Que el Numero de empleado no este vacio
        /// </summary>
        /// <returns></returns>
        private Boolean valida()
        {
            return !(String.IsNullOrEmpty(txtxClave.Text));
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void label1_Click_2(object sender, EventArgs e)
        {

        }

        private void txtxClave_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_3(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Verifica que el check de Socios este checado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void chkSocios_CheckedChanged(object sender, EventArgs e)
        {
            chkEmpleados.Checked = false;
        }

        /// <summary>
        /// Verifica que el check de Empleados este checado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void chkEmpleados_CheckedChanged(object sender, EventArgs e)
        {
            chkSocios.Checked = false;
        }
    }
}
