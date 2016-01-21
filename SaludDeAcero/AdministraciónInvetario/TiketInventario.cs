/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Ticket socio
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LibPrintTicket;
using System.Data;

namespace Sisa.AdministraciónInvetario
{
    public class TicketInventario
    {
        public void imprimirTiket(String IdVenta, String nombreEmpleado, DataTable datos)
        {

            Ticket ticket = new Ticket();
            Double subtotal = 0.0, total = 0.0;
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
            ticket.AddSubHeaderLine("Caja # 1 - Ticket #" + IdVenta);
            ticket.AddSubHeaderLine("Le atendió: " + nombreEmpleado);
            ticket.AddSubHeaderLine("Fecha de venta: " + DateTime.Now.ToString());
            ticket.AddSubHeaderLine(" ");
            // ticket.AddSubHeaderLine("Num. Socio: " + numSocio + " Socio:" + nombreSocio);

            //El metodo AddItem requeire 3 parametros, el primero es cantidad, el segundo es la descripcion
            //del producto y el tercero es el precio
            foreach (DataRow item in datos.Rows)
            {
                ticket.AddItem(item["Clave"].ToString(), item["Clave"].ToString(), item["Costo"].ToString());
                subtotal = Convert.ToDouble(item["Subtotal"].ToString());
                total = Convert.ToDouble(item["Total"].ToString());
            }
            ticket.AddItem(" ", " ", " ");


            //El metodo AddTotal requiere 2 parametros, la descripcion del total, y el precio
            ticket.AddTotal("SUBTOTAL", subtotal.ToString());
            ticket.AddTotal("IVA", "0");
            ticket.AddTotal("TOTAL", total.ToString());
            ticket.AddTotal("", ""); //Ponemos un total en blanco que sirve de espacio
           // ticket.AddTotal("RECIBIDO", recibido);
          //  ticket.AddTotal("CAMBIO", (Convert.ToDouble(recibido) - Convert.ToDouble(Costo)).ToString());
            ticket.AddTotal("", "");//Ponemos un total en blanco que sirve de espacio


            //El metodo AddFooterLine funciona igual que la cabecera
         //  ticket.AddFooterLine("TU SALUD ES NUESTRA PASION...");
           // ticket.AddFooterLine("VIVE LA EXPERIENCIA SALUD DE ACERO");
            ticket.AddFooterLine("GRACIAS POR SU COMPRA");

        }
    }
}