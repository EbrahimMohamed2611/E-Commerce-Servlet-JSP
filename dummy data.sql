INSERT INTO `e-commerce-servlet-jsp`.`users_details` VALUES (1,0,'Cairo','Egypt','Cairo','Smart village','00203',3,'2000-02-12','mail@mail.com','NOT_VERIFY','Fname','MALE','Lname','Pass12345','01234567890','USER_ROLE',NULL);
INSERT INTO `e-commerce-servlet-jsp`.`category_details` VALUES (1,'Test category');
INSERT INTO `e-commerce-servlet-jsp`.`image` VALUES (1,'first name','first image path'),(2,'second image','second image path');
INSERT INTO `e-commerce-servlet-jsp`.`product_details` VALUES (1,'first product',_binary '\0',25,'first product',50,1,NULL,1),(2,'second product',_binary '\0',25,'second product',30,1,NULL,2);
----------------------------------------

INSERT INTO `e-commerce-servlet-jsp`.`product_details` (`PRODUCT_ID`, `PRODUCT_DESCRIPTION`, `PRODUCT_DELETED`, `PRODUCT_PRICE`, `PRODUCT_NAME`, `PRODUCT_QUANTITY`, `CATEGORY_ID`, `IMAGE_ID`) VALUES ('1', 'first orderedProductDTO', b'0', '25', 'first orderedProductDTO', '49.95', '1', '1');
INSERT INTO `e-commerce-servlet-jsp`.`product_details` (`PRODUCT_ID`, `PRODUCT_DESCRIPTION`, `PRODUCT_DELETED`, `PRODUCT_PRICE`, `PRODUCT_NAME`, `PRODUCT_QUANTITY`, `CATEGORY_ID`, `IMAGE_ID`) VALUES ('2', 'second orderedProductDTO', b'0', '25', 'second orderedProductDTO', '30', '1', '2');
