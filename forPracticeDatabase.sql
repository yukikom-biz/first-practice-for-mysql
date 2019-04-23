DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

use book_shop;

-- Robert
-- Products
CREATE TABLE Products( 
product_id BIGINT AUTO_INCREMENT NOT NULL,
product_name varchar(100) NOT NULL,
value int(10) NOT NULL,
PRIMARY KEY (product_id)
);

INSERT INTO Products (product_name, value) VALUES 
("桃太郎",1000),
("物語本A",5000),
("The_Adventures_of_Huck_Finn", 200),
("大切書",1000000000);

-- Prefecture Table
-- Created by komatsu
CREATE TABLE Prefecture(
prefecture_id INT NOT NULL AUTO_INCREMENT,
prefecture_name VARCHAR(50) NOT NULL,
PRIMARY KEY (`prefecture_id`)
);

-- INSERT
INSERT INTO Prefecture(prefecture_name)
VALUES ("北海道"),("青森県"),("岩手県"),("宮城県"),("秋田県"),("山形県"),("福島県"),("茨城県"),("栃木県"),("群馬県"),("埼玉県"),("千葉県"),("東京都"),("神奈川県"),("新潟県"),("富山県"),("石川県"),("福井県"),("山梨県"),("長野県"),("岐阜県"),("静岡県"),
("愛知県"),("三重県"),("滋賀県"),("京都府"),("大阪府"),("兵庫県"),("奈良県"),("和歌山県"),("鳥取県"),("島根県"),("岡山県"),("広島県"),("山口県"),("徳島県"),("香川県"),("愛媛県"),("高知県"),("福岡県"),("佐賀県"),("長崎県"),("熊本県"),("大分県"),("宮崎県"),("鹿児島県"),("沖縄県");

-- Yin
-- Customers
CREATE TABLE Customers(
customer_id BIGINT NOT NULL AUTO_INCREMENT,
customer_name varchar(50) NOT NULL,
prefecture_id INT NOT NULL,
PRIMARY KEY(`customer_id`),
FOREIGN KEY(`prefecture_id`)  REFERENCES Prefecture(prefecture_id)
);

INSERT INTO Customers(customer_id, customer_name, prefecture_id)
VALUES
(1, "Robert", 15),(2, "Yin", 25),(3, "Matsumoto", 35),(4,"Komatsu", 22);

-- Sales
-- Mastumoto
CREATE TABLE Sales(
sales_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_id BIGINT NOT NULL,
customer_id BIGINT NOT NULL,
created_at DATETIME(6) NOT NULL,
FOREIGN KEY (product_id) REFERENCES Products(product_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
KEY sales_customer_id_product_id_idx(product_id, customer_id),
KEY sales_product_id_icustomer_id_dx(customer_id, product_id)
);

INSERT INTO Sales(product_id, customer_id, created_at) VALUES (1,1, NOW()), (2,2,NOW()),  (3,4,NOW());
