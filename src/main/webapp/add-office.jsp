<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Classic Model Offices</title>
    <link rel="icon" href="https://cdn.discordapp.com/attachments/921967767253569557/1175459262529536171/building-fill.svg?ex=656b4ebf&is=6558d9bf&hm=64a0a5ce4289bc224a699bf7946c32ece435e8e324e285317e776ba69c7f53f2&" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.3.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto px-4">
        <div class="text-4xl mt-4 cursor-pointer" onclick="window.location = './office-list'">Classic Model Offices ::</div>
        <div class="divider"></div>
        <button class="btn btn-sm" onclick="window.location = './office-list'">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
                <path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"></path>
                <path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1h7.08zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-7.08z"></path>
            </svg>
            back
        </button>
        <h1 class="text-2xl my-4">
            Add office
        </h1>
        <form action="office-list" method="post" id="officeForm">
            <div class="form-control">
                <label for="officeCode">
                    <span class="label-text">Office Code</span>
                </label>
                <input id="officeCode" class="input input-bordered input-disabled w-full max-w-xs placeholder:opacity-50" name="officeCode" type="number" min="0" value="${requestScope.newOfficeCode}" readonly>
            </div>
            <div class="divider divider-start">Detail</div>
            <div id="officeDetail" class="flex flex-col gap-6">
                <div class="flex gap-4">
                    <div class="form-control">
                        <label for="city">
                            <span class="label-text">City<span class="text-red-400">*</span></span>
                        </label>
                        <input id="city" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="city" type="text" placeholder="ex. San Francisco" required="true">
                    </div>
                    <div class="form-control">
                        <label for="phone">
                            <span class="label-text">Phone<span class="text-red-400">*</span></span>
                        </label>
                        <input id="phone" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="phone" type="text" placeholder="ex. +1 xxx xxx xxxx" required="true">
                    </div>
                </div>
                <div class="flex flex-col gap-4">
                    <div class="form-control">
                        <label for="addressLine1">
                            <span class="label-text">Address line 1<span class="text-red-400">*</span></span>
                        </label>
                        <input id="addressLine1" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="addressLine1" type="text" placeholder="ex. 100 Market Street" required="true">
                    </div>
                    <div class="form-control">
                        <label for="addressLine2">
                            <span class="label-text">Address line 2</span>
                        </label>
                        <input id="addressLine2" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="addressLine2" type="text" placeholder="ex. Suite 300">
                    </div>
                </div>
                <div class="flex gap-4">
                    <div class="flex flex-col gap-4">
                        <div class="form-control">
                            <label for="state">
                                <span class="label-text">State</span>
                            </label>
                            <input id="state" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="state" type="text" placeholder="ex. CA">
                        </div>
                        <div class="form-control">
                            <label for="country">
                                <span class="label-text">Country<span class="text-red-400">*</span></span>
                            </label>
                            <input id="country" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="country" type="text" placeholder="ex. USA" required="true">
                        </div>
                    </div>
                    <div class="flex flex-col gap-4">
                        <div class="form-control">
                            <label for="postalCode">
                                <span class="label-text">Postal code<span class="text-red-400">*</span></span>
                            </label>
                            <input id="postalCode" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="postalCode" type="text" placeholder="ex. 94080" required="true">
                        </div>
                        <div class="form-control">
                            <label for="territory">
                                <span class="label-text">Territory<span class="text-red-400">*</span></span>
                            </label>
                            <input id="territory" class="input input-bordered w-full max-w-xs placeholder:opacity-50" name="territory" type="text" placeholder="ex. NA" required="true">
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
            <button class="btn btn-sm btn-neutral">Submit and add this office</button>
        </form>
    </div>
    <script>
        const form = document.getElementById('officeForm')

        form.addEventListener('submit', (e) => {
            const add = window.confirm('Confirm to add this office.')
            if (!add) e.preventDefault()
        })
    </script>
</body>

</html>

