package sit.int202.classicmodels.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "OfficeListServlet", value = "/office-list")
public class OfficeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        String officeCode = req.getParameter("officeCode");
        String delete = req.getParameter("delete");
        String edit = req.getParameter("edit");
        String add = req.getParameter("add");
        String searchTerms = req.getParameter("searchTerms");

        if (delete != null) {
            officeRepository.delete(officeCode);
            officeCode = null;
        }
        if (officeCode != null) req.setAttribute("selectedOffice", officeRepository.find(officeCode));
        if (searchTerms != null) {
            if (searchTerms.isEmpty()) {
                resp.sendRedirect("./office-list");
                return;
            }
            req.setAttribute("searchTerms", searchTerms);
            req.setAttribute("offices", officeRepository.findByCityOrCountry(searchTerms));
            req.getRequestDispatcher("/search-office.jsp").forward(req, resp);
        }
        if (edit != null) {
            req.getRequestDispatcher("/edit-office.jsp").forward(req, resp);
        }
        if (add != null) {
            int newOfficeCode = Integer.parseInt(officeRepository.findLatest().getOfficeCode()) + 1;
            req.setAttribute("newOfficeCode", newOfficeCode);
            req.getRequestDispatcher("/add-office.jsp").forward(req, resp);
        }

        req.setAttribute("offices", officeRepository.findAll());
        req.getRequestDispatcher("/office-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String ,String[]> params = req.getParameterMap();
        OfficeRepository officeRepository = new OfficeRepository();

        Office office = new Office();
        officeSetup(office, params);
        if (!officeRepository.update(office)) officeRepository.insert(office);
        resp.sendRedirect("office-list");
    }

    private void officeSetup(Office office, Map<String ,String[]> params) {
        office.setOfficeCode(params.get("officeCode")[0]);
        office.setCity(params.get("city")[0]);
        office.setPhone(params.get("phone")[0]);
        office.setAddressLine1(params.get("addressLine1")[0]);
        office.setAddressLine2(params.get("addressLine2")[0]);
        office.setState(params.get("state")[0]);
        office.setCountry(params.get("country")[0]);
        office.setPostalCode(params.get("postalCode")[0]);
        office.setTerritory(params.get("territory")[0]);
    }
}
