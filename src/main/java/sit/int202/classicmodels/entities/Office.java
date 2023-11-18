package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name = "offices")
@Getter
@Setter
@ToString
@NamedQueries({
    @NamedQuery(name = "OFFICE.FIND_ALL", query = "select o from Office o"),
    @NamedQuery(name = "OFFICE.FIND_BY_COUNTRY", query = "select o from Office o where o.country like :countryParam"),
    @NamedQuery(name = "OFFICE.FIND_LATEST", query = "select o from Office o order by o.officeCode DESC limit 1"),
    @NamedQuery(name = "OFFICE.FIND_BY_CITY_OR_COUNTRY", query = "select o from Office o where lower(o.city) like :city or lower(o.country) like :country")
})

public class Office {
    @Id
    private String officeCode;
    @Column(nullable = false)
    private String city;
    @Column(nullable = false)
    private String phone;
    @Column(nullable = false)
    private String addressLine1;
    private String addressLine2;
    @Column(nullable = false)
    private String state;
    @Column(nullable = false)
    private String country;
    @Column(nullable = false)
    private String postalCode;
    @Column(nullable = false)
    private String territory;
    @OneToMany(mappedBy = "officeCode")
    private List<Employee> employeeList;
}
