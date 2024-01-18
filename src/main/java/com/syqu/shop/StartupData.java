package com.syqu.shop;

import com.syqu.shop.domain.Category;
import com.syqu.shop.domain.Product;
import com.syqu.shop.repository.CategoryRepository;
import com.syqu.shop.service.ProductService;
import com.syqu.shop.domain.User;
import com.syqu.shop.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class StartupData implements CommandLineRunner {
    private final UserService userService;
    private final ProductService productService;
    private final CategoryRepository categoryRepository;
    private static final Logger logger = LoggerFactory.getLogger(StartupData.class);

    @Autowired
    public StartupData(UserService userService, ProductService productService, CategoryRepository categoryRepository) {
        this.userService = userService;
        this.productService = productService;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public void run(String... args) {
        adminAccount();
        userAccount();
        category();
        exampleProducts();
    }

    private void userAccount(){
        User user = new User();

        user.setUsername("user");
        user.setPassword("user");
        user.setPasswordConfirm("user");
        user.setGender("Female");
        user.setEmail("user@example.com");

        userService.save(user);
    }

    private void adminAccount(){
        User admin = new User();

        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setPasswordConfirm("admin");
        admin.setGender("Male");
        admin.setEmail("admin@example.com");

        userService.save(admin);
    }

    private void category(){
        Category category1 = new Category();
        Category category2 = new Category();
        Category category3 = new Category();
        Category category4 = new Category();
        category1.setId(1);
        category1.setCategoryName("Laptopuri ,IT");
        category2.setId(2);
        category2.setCategoryName("Telefoane mobile si accesorii");
        category3.setId(3);
        category3.setCategoryName("Tablete si accesorii");
        category4.setId(4);
        category4.setCategoryName("Console, Jocuri si VR");
        categoryRepository.save(category1);
        categoryRepository.save(category2);
        categoryRepository.save(category3);
        categoryRepository.save(category4);
    }

    private void exampleProducts(){
        final String NAME1 = "Laptop Dell Vostro 3520";
        final String IMAGE_URL1 = "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg";
        final String DESCRIPTION1 = "Example Description";
        final BigDecimal PRICE1 = BigDecimal.valueOf(22);

        final String NAME2 = "Laptop Acer Aspire";
        final String IMAGE_URL2 = "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg";
        final String DESCRIPTION2 = "Example Description";
        final BigDecimal PRICE2 = BigDecimal.valueOf(22);

        final String NAME3 = "Laptop Gaming ASUS TUF A15 ";
        final String IMAGE_URL3 = "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg";
        final String DESCRIPTION3 = "Example Description";
        final BigDecimal PRICE3 = BigDecimal.valueOf(22);

        final String NAME4 = "Laptop HP";
        final String IMAGE_URL4 = "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg";
        final String DESCRIPTION4 = "Example Description";
        final BigDecimal PRICE4 = BigDecimal.valueOf(22);

        Product product1 = new Product();
        Product product2 = new Product();
        Product product3 = new Product();
        Product product4 = new Product();

        product1.setName(NAME1);
        product1.setImageUrl(IMAGE_URL1);
        product1.setDescription(DESCRIPTION1);
        product1.setCategory(categoryRepository.findByCategoryName("Laptop Dell Vostro 3520"));
        product1.setPrice(PRICE1);

        product2.setName(NAME2);
        product2.setImageUrl(IMAGE_URL2);
        product2.setDescription(DESCRIPTION2);
        product2.setCategory(categoryRepository.findByCategoryName("Laptop Acer Aspire"));
        product2.setPrice(PRICE2);

        product3.setName(NAME3);
        product3.setImageUrl(IMAGE_URL3);
        product3.setDescription(DESCRIPTION3);
        product3.setCategory(categoryRepository.findByCategoryName("Laptop Gaming ASUS TUF A15"));
        product3.setPrice(PRICE3);

        product4.setName(NAME4);
        product4.setImageUrl(IMAGE_URL4);
        product4.setDescription(DESCRIPTION4);
        product4.setCategory(categoryRepository.findByCategoryName("Laptop HP"));
        product4.setPrice(PRICE4);

        productService.save(product1);
        productService.save(product2);
        productService.save(product3);
        productService.save(product4);
    }
}
