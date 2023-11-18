package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "employees")
@Getter
@Setter
@ToString
@NamedQueries(
        {
                @NamedQuery(name = "EMPLOYEE.FIND_ALL", query = "select e from Employee e"),
        }
)
public class Employee {
    @Id
//    @Column(name = "employeeNumber", nullable = false)
    private Integer employeeNumber;
    private String firstName;
    private String lastName;
    private String email;
    private String jobTitle;
    private String extension;
    private String officeCode;
    private Integer reportsTo;
    @ManyToOne
    @JoinColumn(name = "officeCode", insertable = false, updatable = false)
    private Office office;
}
