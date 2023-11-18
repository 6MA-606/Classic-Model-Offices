package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Office;

import java.util.List;

public class OfficeRepository {
    private EntityManager entityManager;

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public List<Office> findAll() {
        return getEntityManager().createNamedQuery("OFFICE.FIND_ALL").getResultList();
    }

    public Office find(String officeCode) {
        return getEntityManager().find(Office.class, officeCode);
    }

    public Office findLatest() {
        return (Office) getEntityManager().createNamedQuery("OFFICE.FIND_LATEST").getSingleResult();
    }

    public void close() {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }

    public boolean insert(Office office) {
        try {
            EntityManager entityManager =
                    getEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(office);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean delete(Office office) {
        if (office != null) {
            EntityManager entityManager =
                    getEntityManager();
            if (entityManager.contains(office)) {
                entityManager.getTransaction().begin();
                entityManager.remove(office);
                entityManager.getTransaction().commit();
                return true;
            } else {
                return delete(office.getOfficeCode());
            }
        }
        return false;
    }

    public boolean delete(String officeCode) {
        EntityManager entityManager =
                getEntityManager();
        Office office = find(officeCode);
        if (office != null) {
            entityManager.getTransaction().begin();
            entityManager.remove(office);
            entityManager.getTransaction().commit();
            return true;
        }
        return false;
    }

    public boolean update(Office updateOffice) {
        if (updateOffice != null) {
            EntityManager entityManager = getEntityManager();
            Office existingOffice = find(updateOffice.getOfficeCode());
            if (existingOffice != null) {
                entityManager.getTransaction().begin();
                existingOffice.setCity(updateOffice.getCity());
                existingOffice.setPhone(updateOffice.getPhone());
                existingOffice.setAddressLine1(updateOffice.getAddressLine1());
                existingOffice.setAddressLine2(updateOffice.getAddressLine2());
                existingOffice.setState(updateOffice.getState());
                existingOffice.setCountry(updateOffice.getCountry());
                existingOffice.setPostalCode(updateOffice.getPostalCode());
                existingOffice.setTerritory(updateOffice.getTerritory());
                entityManager.getTransaction().commit();
                return true;
            }
        }
        return false;
    }

    public List<Office> findByCityOrCountry(String cityOrCountry) {
        cityOrCountry = cityOrCountry.toLowerCase()+'%';
        Query query = getEntityManager().createNamedQuery("OFFICE.FIND_BY_CITY_OR_COUNTRY");
        query.setParameter("city", cityOrCountry);
        query.setParameter("country", cityOrCountry);
        return query.getResultList();
    }
}

