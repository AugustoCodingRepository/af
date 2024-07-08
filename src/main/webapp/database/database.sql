DROP DATABASE IF EXISTS altafrequenza;
CREATE DATABASE altafrequenza;
USE altafrequenza;


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
  `Month_Expiration` int DEFAULT NULL,
  `Year_Expiration` int DEFAULT NULL,
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
  PRIMARY KEY (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `utente` (`User_ID`)
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
  'UserName' varchar(20) NOT NULL,
  `Valutazione` int DEFAULT NULL,
  `Descrizione` varchar(512) DEFAULT '',
  'User_ID' int not null,
  Product_ID int not null,
  PRIMARY KEY (`Recensione_ID`),
  FOREIGN KEY ('User_ID') REFERENCES 'utente' ('User_ID'),
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

CREATE TABLE prodotto_ordine (
    Product_ID INT,
    Order_ID INT,
    PRIMARY KEY (Product_ID, Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES prodotto(Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES ordine(Order_ID)
);


INSERT INTO categoria (Nome)
VALUES
('Amplificatori'),
('Tastiere'),
('Chitarre Elettriche'),
('Cuffie'),
('Mixer')

INSERT INTO prodotto (Product_Name,Brand,Model,Quantity,Price,IVA,Categoria_ID,Descrizione, imgProduct)
VALUES
('CHITARRA ELETTRICA G250 TAB','Alta Frequenza','Serie G',10,279.00,10,3,"La nuova G250 in tiglio, con manico in acero e tastiera in jatoba, dispone inoltre di una configurazione dei pickup HSS con push-pull per splittare l’humbucker, che fornisce un'ampia varietà di suoni per coprire praticamente qualsiasi stile musicale. Quattro bellissime finiture, tutte da scoprire!", null),

('CHITARRA ELETTRICA G110 OPSB','Alta Frequenza','Serie G',10,199.00,10,3,"La G110, entry-level della serie, dispone di ponte tremolo 6-viti e di una configurazione pickup HSS, per un'ampia varietà di suoni adatta a qualsiasi stile musicale, offrendo la grande suonabilità per la quale la serie G è nota!", null),

('CHITARRA ELETTRICA G110 OPBC','Alta Frequenza','Serie G',10,199.00,10,3,"La G110, entry-level della serie, dispone di ponte tremolo 6-viti e di una configurazione pickup HSS, per un'ampia varietà di suoni adatta a qualsiasi stile musicale, offrendo la grande suonabilità per la quale la serie G è nota!", null),

('CHITARRA ELETTRICA G25a0 SVM','Alta Frequenza','Serie G',10,279.00,10,3,"La nuova G250 in tiglio, con manico in acero e tastiera in jatoba, dispone inoltre di una configurazione dei pickup HSS con push-pull per splittare l’humbucker, che fornisce un'ampia varietà di suoni per coprire praticamente qualsiasi stile musicale.", null),

('CHITARRA ELETTRICAS-300 SUNBURST','Alta Frequenza','Serie Starter',10,149.00,10,3,"Dalla classica forma stratocaster, questa s 300 ha configurazione S/S/S, due toni un volume e selettore a 5 posizioni. Corpo in Ontano, manico in Acero, tastiera in South American Rouparà (Parinari Campestris) a 22 tasti. Disponibile in più colorazioni.", null),

('CHITARRA ELETTRICA S-300 CREAM','Alta Frequenza','Serie Starter',10,149.00,10,3,"Dalla classica forma stratocaster, questa s 300 ha configurazione S/S/S, due toni un volume e selettore a 5 posizioni. Corpo in Ontano, manico in Acero, tastiera in South American Rouparà (Parinari Campestris) a 22 tasti. Disponibile in più colorazioni.", null)

