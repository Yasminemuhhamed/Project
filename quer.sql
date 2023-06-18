CREATE SCHEMA IF NOT EXISTS `Adventurous` DEFAULT CHARACTER SET utf8 ;
USE `Adventurous` ;

-- Table `Adventurous`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`User` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `First Name` VARCHAR(45) NOT NULL,
  `Last Name` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` INT NOT NULL,
  `Address` VARCHAR(60) NOT NULL,
  `Age` INT NOT NULL,
  `Phonenumber` CHAR(15) NOT NULL,
  `Invoice_Number` INT NOT NULL,
  PRIMARY KEY (`ID`, `Invoice_Number`),
  INDEX `fk_User_Invoice1_idx` (`Invoice_Number` ASC),
  CONSTRAINT `fk_User_Invoice1`
    FOREIGN KEY (`Invoice_Number`)
    REFERENCES `Adventurous`.`Invoice` (`Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Invoice`
CREATE TABLE IF NOT EXISTS `Adventurous`.`Invoice` (
  `Number` INT NOT NULL,
  `Date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`Number`))
ENGINE = InnoDB;

-- Table `Adventurous`.`Work with`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Work with` (
  `User_ID` INT NOT NULL,
  `Host_ID` INT NOT NULL,
  PRIMARY KEY (`User_ID`, `Host_ID`),
  INDEX `fk_User_has_Host_Host1_idx` (`Host_ID` ASC),
  INDEX `fk_User_has_Host_User_idx` (`User_ID` ASC),
  CONSTRAINT `fk_User_has_Host_User`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Adventurous`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Host_Host1`
    FOREIGN KEY (`Host_ID`)
    REFERENCES `Adventurous`.`Host` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Host` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NOT NULL, 
  `Phone number` CHAR(15) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

-- Table `Adventurous`.`Suggest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Suggest` (
  `User_ID` INT NOT NULL,
  `Complain_Code` INT NOT NULL,
  PRIMARY KEY (`User_ID`, `Complain_Code`),
  INDEX `fk_User_has_Complain_Complain1_idx` (`Complain_Code` ASC),
  INDEX `fk_User_has_Complain_User1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_User_has_Complain_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Adventurous`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Complain_Complain1`
    FOREIGN KEY (`Complain_Code`)
    REFERENCES `Adventurous`.`Complain` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Complain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Complain` (
  `Code` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Message` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Code`))
ENGINE = InnoDB;

-- Table `Adventurous`.`Ask for`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Ask for` (
  `User_ID` INT NOT NULL,
  `Transportation_Code` INT  NOT NULL,
  PRIMARY KEY (`User_ID`, `Transportation_Code`),
  INDEX `fk_User_has_Transportation_Transportation1_idx` (`Transportation_Code` ASC),
  INDEX `fk_User_has_Transportation_User1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_User_has_Transportation_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Adventurous`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Transportation_Transportation1`
    FOREIGN KEY (`Transportation_Code`)
    REFERENCES `Adventurous`.`Transportation` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Transportation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Transportation` (
  `Code` INT NOT NULL,
  `Phone` CHAR(15) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Code`))
ENGINE = InnoDB;

-- Table `Adventurous`.`Ask`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Ask` (
  `User_ID` INT NOT NULL,
  `Program_Code` INT NOT NULL,
  PRIMARY KEY (`User_ID`, `Program_Code`),
  INDEX `fk_User_has_Program_Program1_idx` (`Program_Code` ASC),
  INDEX `fk_User_has_Program_User1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_User_has_Program_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Adventurous`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Program_Program1`
    FOREIGN KEY (`Program_Code`)
    REFERENCES `Adventurous`.`Program` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Program` (
  `Code` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Code`))
ENGINE = InnoDB;

-- Table `Adventurous`.`Reserve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Reserve` (
  `User_ID` INT NOT NULL,
  `Reservation_Code` INT NOT NULL,
  PRIMARY KEY (`User_ID`, `Reservation_Code`),
  INDEX `fk_User_has_Reservation_Reservation1_idx` (`Reservation_Code` ASC),
  INDEX `fk_User_has_Reservation_User1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_User_has_Reservation_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Adventurous`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Reservation_Reservation1`
    FOREIGN KEY (`Reservation_Code`)
    REFERENCES `Adventurous`.`Reservation` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `Adventurous`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Adventurous`.`Reservation` (
    `Code` INT NOT NULL,
    `Name` VARCHAR(45) NOT NULL,
    `Date` DATETIME(6) NOT NULL,
    `Type` VARCHAR(45) NOT NULL,
    `Location` VARCHAR(45) NOT NULL,
    `Email` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`Code`)
)  ENGINE=INNODB;
