package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;

@NamedQueries({
        @NamedQuery(name = "PRODUCT.FIND_ALL", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "PRODUCT.COUNT", query = "SELECT count(p) as count FROM Product p")
})
@Table(name = "products", indexes = {
        @Index(name = "productLine", columnList = "productLine")
})
@Entity
@Getter
public class Product {
    @Id
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    private int quantityInStock;
    private double buyPrice;
    @Column(name = "MSRP")
    private double price;
}
