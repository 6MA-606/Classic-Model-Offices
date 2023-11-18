package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.repositories.ProductRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/product-list")
public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        ProductRepository productRepository = new ProductRepository();
        String pageParam = req.getParameter("page");
        String pageSizeParam = req.getParameter("pageSize");
        int page = pageParam==null ? 1 : Integer.valueOf(pageParam);
        int pageSize = pageSizeParam==null ? productRepository.getDefaultPageSize() : Integer.valueOf(pageSizeParam);
        List<Product> productList = productRepository.findAll(page, pageSize);
        req.setAttribute("products", productList);
        req.setAttribute("page", page);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("itemCount", productRepository.countAll());
        int itemCount = productRepository.countAll();
        int totalPage = itemCount / pageSize + (itemCount % pageSize == 0 ? 0 : 1);
        req.setAttribute("totalPage", totalPage);
//        getServletContext().getRequestDispatcher("/product-list.jsp").forward(req, resp);
        getServletContext().getRequestDispatcher("/new-product-list.jsp").forward(req, resp);
    }
}