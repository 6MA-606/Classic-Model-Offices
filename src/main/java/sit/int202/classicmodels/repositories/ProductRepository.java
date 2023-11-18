package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Product;

import java.util.List;

public class ProductRepository {
    private static int PAGE_SIZE = 10;

    public int getDefaultPageSize() {
        return PAGE_SIZE;
    }

    public List<Product> findAll(int page, int pageSize) {
        int startPosition = (page - 1) * pageSize;
        EntityManager entityManager = EntityManagerBuilder.getEntityManager();
        Query query = entityManager.createNamedQuery("PRODUCT.FIND_ALL");
        query.setFirstResult(startPosition);
        query.setMaxResults(pageSize);
        List<Product> productList = query.getResultList();
        entityManager.close();
        return productList;
    }

    public int countAll() {
        EntityManager entityManager = EntityManagerBuilder.getEntityManager();
        int number = ((Number)
                entityManager.createNamedQuery("PRODUCT.COUNT").getSingleResult()).intValue();
        entityManager.close();
        return number;
    }
}
