<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Classic Model Offices</title>
    <link rel="icon" href="https://cdn.discordapp.com/attachments/921967767253569557/1175459262529536171/building-fill.svg?ex=656b4ebf&is=6558d9bf&hm=64a0a5ce4289bc224a699bf7946c32ece435e8e324e285317e776ba69c7f53f2&" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.3.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function deleteOffice(officeCode) {
            if (window.confirm('Do you want to delete the office ' + officeCode)) {
                window.location = './office-list?delete=true&officeCode=' + officeCode
            }
        }
    </script>
</head>
<body>
    <div class="container mx-auto px-4">
        <div class="text-4xl mt-4 cursor-pointer" onclick="window.location = './office-list'">Classic Model Offices ::</div>
        <div class="divider"></div>
        <div class="flex justify-between items-center mb-5">
            <button class="btn btn-sm" onclick="window.location = './office-list?add=true'">Add Office</button>
            <form id="searchForm" class="flex items-center" method="get">
                <button class="absolute translate-x-3" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                    </svg>
                </button>
                <input class="input input-bordered w-full max-w-xs pl-10" name="searchTerms" type="text" placeholder="Search by city or country...">
            </form>
        </div>
        <div class="grid grid-cols-4 grid-flow-row mt-2 my-4">
            <c:forEach items="${requestScope.offices}" var="office">
                <div class="border-2 border-base-300 box-border rounded p-2 m-2 min-h-[7.2rem] h-auto
                    ${office.officeCode == requestScope.selectedOffice.officeCode ? 'bg-base-200' : 'cursor-pointer'}"
                     onclick="if (${office.officeCode != requestScope.selectedOffice.officeCode}) window.location = './office-list?officeCode=${office.officeCode}'"
                >
                    <div class="font-bold"><span class="underline">${office.city}</span>, ${office.country}</div>
                    <div>${office.phone}</div>
                    <c:if test="${office.officeCode == requestScope.selectedOffice.officeCode}">
                        <div class="mt-3">
                            <button class="btn btn-sm btn-outline" onclick="window.location = './office-list?edit=true&officeCode=${office.officeCode}'">edit</button>
                            <button class="btn btn-sm btn-error btn-outline" onclick="deleteOffice('${office.officeCode}')">delete</button>
                        </div>
                    </c:if>
                    <c:if test="${office.officeCode != requestScope.selectedOffice.officeCode}">
                        <div class="text-sm opacity-75 mt-3">
                            <div>
                                ${office.addressLine1}
                                <c:if test="${office.addressLine2 != null}">, ${office.addressLine2}</c:if>
                            </div>
                            <div>${office.postalCode}</div>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <c:if test="${requestScope.selectedOffice.officeCode != null}">
            <div class="divider"></div>
            <div class="my-4">
                <b>Employees ::</b>
            </div>
            <div class="grid grid-cols-5 grid-flow-row">
                <c:forEach items="${requestScope.selectedOffice.employeeList}" var="employee">
                    <div class="p-2 m-2 border-2 border-base-300 box-border rounded-lg">
                        <div class="text-sm opacity-75">${employee.jobTitle}</div>
                        <div>${employee.firstName} ${employee.lastName}</div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
    <script>
        const searchForm = document.getElementById("searchForm")
        const searchTermsInput = document.getElementsByName("searchTerms")[0]

        searchForm.addEventListener('submit', (e) => {
            if (searchTermsInput.value === '') {
                e.preventDefault()
            }
        })
    </script>
</body>
</html>
