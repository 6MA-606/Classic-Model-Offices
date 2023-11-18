<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Office</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.3.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto px-4">
        <div class="text-4xl mt-4 cursor-pointer" onclick="window.location = './office-list'">Classic Model Offices ::</div>
        <div class="divider"></div>
        <button class="btn btn-sm btn-neutral" onclick="window.location = './office-list'"><- back</button>
        <h1 class="text-2xl my-4">
            Edit office details
        </h1>
        <form action="office-list" method="post" id="officeForm">
            <div class="form-control">
                <label for="officeCode">
                    <span class="label-text">Office Code</span>
                </label>
                <input id="officeCode" class="input input-bordered input-disabled w-full max-w-xs placeholder:opacity-50" name="officeCode" type="number" min="0" value="${requestScope.selectedOffice.officeCode}" readonly>
            </div>
            <div class="divider divider-start">Detail</div>
            <div id="officeDetail" class="flex flex-col gap-6">
                <div class="flex gap-4">
                    <div class="form-control">
                        <label for="city">
                            <span class="label-text">City<span class="text-red-400">*</span></span>
                        </label>
                        <input id="city" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="city" type="text" placeholder="ex. San Francisco" value="${requestScope.selectedOffice.city}" required="true">
                    </div>
                    <div class="form-control">
                        <label for="phone">
                            <span class="label-text">Phone<span class="text-red-400">*</span></span>
                        </label>
                        <input id="phone" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="phone" type="text" placeholder="ex. +1 xxx xxx xxxx" value="${requestScope.selectedOffice.phone}" required="true">
                    </div>
                </div>
                <div class="flex flex-col gap-4">
                    <div class="form-control">
                        <label for="addressLine1">
                            <span class="label-text">Address line 1<span class="text-red-400">*</span></span>
                        </label>
                        <input id="addressLine1" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="addressLine1" type="text" placeholder="ex. 100 Market Street" value="${requestScope.selectedOffice.addressLine1}" required="true">
                    </div>
                    <div class="form-control">
                        <label for="addressLine2">
                            <span class="label-text">Address line 2</span>
                        </label>
                        <input id="addressLine2" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="addressLine2" type="text" placeholder="ex. Suite 300" value="${requestScope.selectedOffice.addressLine2}">
                    </div>
                </div>
                <div class="flex gap-4">
                    <div class="flex flex-col gap-4">
                        <div class="form-control">
                            <label for="state">
                                <span class="label-text">State</span>
                            </label>
                            <input id="state" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="state" type="text" placeholder="ex. CA" value="${requestScope.selectedOffice.state}">
                        </div>
                        <div class="form-control">
                            <label for="country">
                                <span class="label-text">Country<span class="text-red-400">*</span></span>
                            </label>
                            <input id="country" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="country" type="text" placeholder="ex. USA" value="${requestScope.selectedOffice.country}" required="true">
                        </div>
                    </div>
                    <div class="flex flex-col gap-4">
                        <div class="form-control">
                            <label for="postalCode">
                                <span class="label-text">Postal code<span class="text-red-400">*</span></span>
                            </label>
                            <input id="postalCode" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="postalCode" type="text" placeholder="ex. 94080" value="${requestScope.selectedOffice.postalCode}" required="true">
                        </div>
                        <div class="form-control">
                            <label for="territory">
                                <span class="label-text">Territory<span class="text-red-400">*</span></span>
                            </label>
                            <input id="territory" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="territory" type="text" placeholder="ex. NA" value="${requestScope.selectedOffice.territory}" required="true">
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
            <button class="btn btn-sm btn-neutral">Submit to edit this office details</button>
        </form>
    </div>
    <script>
        const form = document.getElementById('officeForm')

        form.addEventListener('submit', (e) => {
            const add = window.confirm('Confirm to edit this office\'s details.')
            if (!add) e.preventDefault()
        })
    </script>
</body>

</html>

