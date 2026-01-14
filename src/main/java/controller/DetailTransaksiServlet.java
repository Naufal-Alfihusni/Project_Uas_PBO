package controller;

import dao.TransactionDAO;
import model.TransactionItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailTransaksiServlet", urlPatterns = {"/DetailTransaksiServlet"})
public class DetailTransaksiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int transId = Integer.parseInt(idStr);
            TransactionDAO dao = new TransactionDAO();
            List<TransactionItem> items = dao.getTransactionItems(transId);
            
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                // Generate baris tabel HTML untuk dikirim ke AJAX
                for (TransactionItem item : items) {
                    out.println("<tr>");
                    out.println("<td>" + item.getNamaMenu() + "</td>");
                    out.println("<td class='text-center'>" + item.getQuantity() + "</td>");
                    out.println("<td class='text-end'>Rp " + String.format("%,.0f", item.getSubtotal()) + "</td>");
                    out.println("</tr>");
                }
            }
        }
    }
}