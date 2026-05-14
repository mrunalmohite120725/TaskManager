Practical 19 — Product Inventory Management System

You need:

Custom Object
Apex Controller
Visualforce Page
CRUD Operations

Fields:

Product Name
Serial No
Manufacture Date
Expiry Date
PART 1 — Create Custom Object
Step 1

Open:

Setup → Object Manager
Step 2

Click:

Create → Custom Object

Fill:

Field	Value
Label	Product
Plural Label	Products
Object Name	Product

Click:

Save
PART 2 — Create Fields

Open:

Product → Fields & Relationships

Create these fields.

Field 1 — Serial No
Option	Value
Type	Text
Label	Serial No
Length	30

Save.

Field 2 — Manufacture Date
Option	Value
Type	Date
Label	Manufacture Date

Save.

Field 3 — Expiry Date
Option	Value
Type	Date
Label	Expiry Date

Save.

PART 3 — Check API Names

They may become:

Label	API Name
Serial No	Serial_No__c
Manufacture Date	Manufacture_Date__c
Expiry Date	Expiry_Date__c

Object:

Product__c
PART 4 — Create Apex Controller
Step 4

Search:

Apex Classes

Click:

New

Paste this code.

ProductController.cls
public class ProductController {

    public Product__c pro {get; set;}

    public ProductController() {

        pro = new Product__c();
    }

    // Insert Product

    public void saveProduct() {

        insert pro;

        pro = new Product__c();
    }

    // Display Products

    public List<Product__c> getProducts() {

        return
        [
            SELECT Id,
                   Name,
                   Serial_No__c,
                   Manufacture_Date__c,
                   Expiry_Date__c
            FROM Product__c
        ];
    }

    // Delete Product

    public void deleteProduct() {

        String productId =
        ApexPages.currentPage()
        .getParameters()
        .get('delId');

        Product__c p =
        [
            SELECT Id
            FROM Product__c
            WHERE Id = :productId
        ];

        delete p;
    }
}

Save.

Class name:

ProductController
PART 5 — Create Visualforce Page
Step 5

Search:

Visualforce Pages

Click:

New

Page name:

ProductPage
ProductPage.page

Paste this code.

<apex:page controller="ProductController">

    <style>

        body{
            font-family: Arial;
            background:#f4f6f9;
        }

        .mainBox{
            width:65%;
            margin:auto;
            margin-top:30px;
            background:white;
            padding:25px;
            border-radius:10px;
            box-shadow:0px 0px 10px gray;
        }

        .title{
            text-align:center;
            font-size:30px;
            color:#2e6da4;
            margin-bottom:20px;
        }

    </style>

    <div class="mainBox">

        <div class="title">
            Product Inventory Management
        </div>

        <apex:form>

            <!-- Add Product -->

            <apex:pageBlock title="Add Product">

                <apex:pageBlockSection columns="1">

                    <apex:inputField value="{!pro.Name}"/>

                    <apex:inputField
                        value="{!pro.Serial_No__c}"/>

                    <apex:inputField
                        value="{!pro.Manufacture_Date__c}"/>

                    <apex:inputField
                        value="{!pro.Expiry_Date__c}"/>

                </apex:pageBlockSection>

                <apex:commandButton
                    value="Save Product"
                    action="{!saveProduct}"/>

            </apex:pageBlock>

            <br/>

            <!-- Product Records -->

            <apex:pageBlock title="Product Records">

                <apex:pageBlockTable
                    value="{!products}"
                    var="p">

                    <apex:column
                        headerValue="Product Name"
                        value="{!p.Name}"/>

                    <apex:column
                        headerValue="Serial No"
                        value="{!p.Serial_No__c}"/>

                    <apex:column
                        headerValue="Manufacture Date"
                        value="{!p.Manufacture_Date__c}"/>

                    <apex:column
                        headerValue="Expiry Date"
                        value="{!p.Expiry_Date__c}"/>

                    <!-- Delete -->

                    <apex:column
                        headerValue="Action">

                        <apex:commandLink
                            value="Delete"
                            action="{!deleteProduct}">

                            <apex:param
                                name="delId"
                                value="{!p.Id}"/>

                        </apex:commandLink>

                    </apex:column>

                </apex:pageBlockTable>

            </apex:pageBlock>

        </apex:form>

    </div>

</apex:page>

Save.

PART 6 — Run Project

After save:

Click:
Preview

OR open:

/apex/ProductPage
