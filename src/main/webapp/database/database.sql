DROP DATABASE IF EXISTS fff;
CREATE DATABASE fff;
USE fff;


DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `Categoria_ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(20) NOT NULL,
  PRIMARY KEY (`Categoria_ID`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `Via` varchar(30) DEFAULT NULL,
  `Civico` int DEFAULT NULL,
  `CAP` int DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `Nazione` varchar(20) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Ruolo` enum('Utente','Admin') DEFAULT 'Utente',
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`email`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `metododipagamento`;
CREATE TABLE `metododipagamento` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Payment_Type` enum('Paypal','Carta di credito/debito') DEFAULT NULL,
  `User_ID` int NOT NULL,
  `PayPal_Email` varchar(30) DEFAULT NULL,
  `Card_Expiration` date DEFAULT NULL,
  `Card_Number` bigint DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  CHECK (((`CVV` >= 0) and (`CVV` <= 999)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `ordine`;
CREATE TABLE `ordine` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Order_Data` date NOT NULL,
  `Delivery_Data` date NOT NULL,
  `Cost` int NOT NULL,
  `product_list` json NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `utente` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `preferenza` (
  `Product_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Product_ID`,`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `prodotto`;
CREATE TABLE `prodotto` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `IVA` int NOT NULL,
  `Categoria_ID` int NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `imgProduct` mediumblob,
  PRIMARY KEY (`Product_ID`),
  KEY `Categoria_ID` (`Categoria_ID`),
  FOREIGN KEY (`Categoria_ID`) REFERENCES `categoria` (`Categoria_ID`),
  CHECK (((`IVA` > 0) and (`IVA` < 101)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `recensione`;
CREATE TABLE `recensione` (
  `Recensione_ID` int NOT NULL AUTO_INCREMENT,
  `Valutazione` int DEFAULT NULL,
  `Descrizione` varchar(512) DEFAULT '',
  PRIMARY KEY (`Recensione_ID`),
  CONSTRAINT `recensione_chk_1` CHECK (((`Valutazione` >= 0) and (`Valutazione` <= 5)))
) ;


DROP TABLE IF EXISTS `transazione`;
CREATE TABLE `transazione` (
  `Transaction_ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Esito` enum('APPROVATA','RIFIUTATA') DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  FOREIGN KEY (`Order_ID`) REFERENCES `ordine` (`Order_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `utente` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
