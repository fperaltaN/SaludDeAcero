/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Ticket socio
'' =============================================*/
using LibPrintTicket;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SaludDeAcero.AdministraciónPagos
{
    public class TicketSocio
    {
        public void imprimirTicket()
        {
            Ticket ticket = new Ticket();
            //Image image = Image.FromFile("~\\SaludDeAcero\\Imagenes\\logoSA.png");
            // Set the position  on the form.
            //ticket.HeaderImage = image; //esta propiedad no es obligatoria

            ticket.AddHeaderLine("STARBUCKS COFFEE TAMAULIPAS");
            ticket.AddHeaderLine("EXPEDIDO EN:");
            ticket.AddHeaderLine("AV. TAMAULIPAS NO. 5 LOC. 101");
            ticket.AddHeaderLine("MEXICO, DISTRITO FEDERAL");
            ticket.AddHeaderLine("RFC: CSI-020226-MV4");

            //El metodo AddSubHeaderLine es lo mismo al de AddHeaderLine con la diferencia
            //de que al final de cada linea agrega una linea punteada "=========="
            ticket.AddSubHeaderLine("Caja # 1 - Ticket # 1");
            ticket.AddSubHeaderLine("Le atendió: Prueba");
            ticket.AddSubHeaderLine(DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString());

            //El metodo AddItem requeire 3 parametros, el primero es cantidad, el segundo es la descripcion
            //del producto y el tercero es el precio
            ticket.AddItem("1", "Articulo Prueba", "15.00");
            ticket.AddItem("2", "Articulo Prueba", "25.00");

            //El metodo AddTotal requiere 2 parametros, la descripcion del total, y el precio
            ticket.AddTotal("SUBTOTAL", "29.75");
            ticket.AddTotal("IVA", "5.25");
            ticket.AddTotal("TOTAL", "35.00");
            ticket.AddTotal("", ""); //Ponemos un total en blanco que sirve de espacio
            ticket.AddTotal("RECIBIDO", "50.00");
            ticket.AddTotal("CAMBIO", "15.00");
            ticket.AddTotal("", "");//Ponemos un total en blanco que sirve de espacio
            ticket.AddTotal("USTED AHORRO", "0.00");

            //El metodo AddFooterLine funciona igual que la cabecera
            ticket.AddFooterLine("EL CAFE ES NUESTRA PASION...");
            ticket.AddFooterLine("VIVE LA EXPERIENCIA EN STARBUCKS");
            ticket.AddFooterLine("GRACIAS POR TU VISITA");

            //Y por ultimo llamamos al metodo PrintTicket para imprimir el ticket, este metodo necesita un
            //parametro de tipo string que debe de ser el nombre de la impresora.
           // ticket.PrintTicket("Epson 720X");
            ticket.PrintTicket("Microsoft Print to PDF");
        }
    }
}