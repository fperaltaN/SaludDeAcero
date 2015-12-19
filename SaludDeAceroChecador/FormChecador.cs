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
                    N_Checador objChec = new N_Checador();
                    objChec.addChecadors(txtxClave.Text);                 
                }
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
    }
}
