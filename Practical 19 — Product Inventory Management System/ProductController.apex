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
