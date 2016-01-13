/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Ticket socio
'' =============================================*/
using LibPrintTicket;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SaludDeAcero.AdministraciónPagos
{
    public class TicketSocio
    {
        public void imprimirTicket(String idPago,String numSocio, String nombreSocio, String nombreEmpleado, String paquete,String fechaVence,String costo,String recibido,String adeudo)
        {
            Ticket ticket = new Ticket();
            //Image image = Image.FromFile("~\\SaludDeAcero\\Imagenes\\logoSA.png");
            // Set the position  on the form.
            //ticket.HeaderImage = image; //esta propiedad no es obligatoria

            ticket.AddHeaderLine("SALUD DE ACERO");
            ticket.AddHeaderLine("EXPEDIDO EN:");
            ticket.AddHeaderLine("CALLE PALOMAR NO. 1 LOC. 1");
            ticket.AddHeaderLine("MEXICO, FRESNILLO ZACATECAS");
            ticket.AddHeaderLine("RFC: CSI-020226-MV4");

            //El metodo AddSubHeaderLine es lo mismo al de AddHeaderLine con la diferencia
            //de que al final de cada linea agrega una linea punteada "=========="
            ticket.AddSubHeaderLine("Caja # 1 - Ticket #" + idPago);
            ticket.AddSubHeaderLine("Le atendió: "  + nombreEmpleado);
            ticket.AddSubHeaderLine("Fecha del pago: " + DateTime.Now.ToString() + "Fecha de Vencimiento:" + fechaVence);
            ticket.AddSubHeaderLine(" ");
            ticket.AddSubHeaderLine("Num. Socio: "+ numSocio + " Socio:" + nombreSocio);

            //El metodo AddItem requeire 3 parametros, el primero es cantidad, el segundo es la descripcion
            //del producto y el tercero es el precio
            ticket.AddItem("1", paquete, costo);
            ticket.AddItem(" " ," "," ");

            //El metodo AddTotal requiere 2 parametros, la descripcion del total, y el precio
            ticket.AddTotal("SUBTOTAL", costo);
            ticket.AddTotal("IVA", "0");
            ticket.AddTotal("TOTAL", costo);
            ticket.AddTotal("", ""); //Ponemos un total en blanco que sirve de espacio
            ticket.AddTotal("RECIBIDO", recibido);
            ticket.AddTotal("CAMBIO",( Convert.ToDouble(recibido) - Convert.ToDouble(costo)).ToString());
            ticket.AddTotal("ADEUDO", adeudo);
            ticket.AddTotal("", "");//Ponemos un total en blanco que sirve de espacio
            ticket.AddTotal("USTED AHORRO", "0.00");

            //El metodo AddFooterLine funciona igual que la cabecera
            ticket.AddFooterLine("TU SALUD ES NUESTRA PASION...");
            ticket.AddFooterLine("VIVE LA EXPERIENCIA SALUD DE ACERO");
            ticket.AddFooterLine("GRACIAS POR SU PREFERENCIA");

            //Y por ultimo llamamos al metodo PrintTicket para imprimir el ticket, este metodo necesita un
            //parametro de tipo string que debe de ser el nombre de la impresora.
           // ticket.PrintTicket("Epson 720X");
            ticket.PrintTicket(ConfigurationManager.AppSettings["Impresora"]);
        }
    }
}