DROP SEQUENCE IF EXISTS seq_policy;
DROP SEQUENCE IF EXISTS seq_policy_edit_log;
DROP SEQUENCE IF EXISTS seq_bill;
DROP SEQUENCE IF EXISTS seq_payment_detail;
DROP SEQUENCE IF EXISTS seq_driver;
DROP SEQUENCE IF EXISTS seq_driver_address;
DROP SEQUENCE IF EXISTS seq_vehicle;
DROP SEQUENCE IF EXISTS seq_vehicle_driver;
DROP SEQUENCE IF EXISTS seq_coverage;
DROP SEQUENCE IF EXISTS seq_policy_coverage;
DROP SEQUENCE IF EXISTS seq_vehicle_coverage;
DROP SEQUENCE IF EXISTS seq_traffic_violation_code;
DROP SEQUENCE IF EXISTS seq_driver_traffic_violation_record;
GO

DROP TABLE IF EXISTS Driver_Traffic_Violation_Record;
DROP TABLE IF EXISTS Traffic_Violation_Code;
DROP TABLE IF EXISTS Vehicle_Coverage;
DROP TABLE IF EXISTS Policy_Coverage;
DROP TABLE IF EXISTS Coverage;
DROP TABLE IF EXISTS Vehicle_Driver;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Driver_Address;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS Payment_Detail;
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS Policy_Edit_Log;
DROP TABLE IF EXISTS Policy;
GO

-- =========================================
-- SEQUENCE OBJECTS
-- =========================================
CREATE SEQUENCE seq_policy START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_policy_edit_log START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_bill START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_payment_detail START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_driver START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_driver_address START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_vehicle START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_vehicle_driver START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_coverage START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_policy_coverage START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_vehicle_coverage START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_traffic_violation_code START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_driver_traffic_violation_record START WITH 1 INCREMENT BY 1;
GO

-- =========================================
-- TABLE: Policy
-- =========================================
CREATE TABLE Policy (
    Policy_ID                 INT PRIMARY KEY,
    Policy_Number             VARCHAR(50)	NOT NULL,
    Policy_Effective_Date     DATE	NOT NULL,
    Policy_Expire_Date        DATE	NOT NULL,
    Payment_Option            VARCHAR(50)	NOT NULL,
    Total_Amount              DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Active                    BIT	NOT NULL DEFAULT 1,
    Additional_Info           TEXT	NOT NULL,
    Created_Date              DATE	NOT NULL
);
GO

-- =========================================
-- TABLE: Policy_Edit_Log
-- =========================================
CREATE TABLE Policy_Edit_Log (
    Policy_Edit_Log_ID   INT PRIMARY KEY,
    Policy_ID            INT NOT NULL,
    Edited_Table_Name    VARCHAR(50),
    Edited_Date          DATE NOT NULL,
    Additional_Info      TEXT,
    Edited_By            VARCHAR(50) NOT NULL,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
GO

-- =========================================
-- TABLE: Bill
-- =========================================
CREATE TABLE Bill (
    Bill_ID          INT PRIMARY KEY,
    Policy_ID        INT NOT NULL,
    Due_Date         DATE NOT NULL,
    Minimum_Payment  DECIMAL(10,2) NOT NULL,
    Created_Date     DATE NOT NULL,
    Balance          DECIMAL(10,2) NOT NULL,
    Status           VARCHAR(50) NOT NULL DEFAULT 'Unpaid',
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
GO

-- =========================================
-- TABLE: Payment_Detail
-- =========================================
CREATE TABLE Payment_Detail (
    Payment_Detail_ID     INT PRIMARY KEY,
    Bill_ID               INT NOT NULL,
    Paid_Date             DATE NOT NULL,
    Amount                DECIMAL(10,2)	NOT NULL,
    Payment_Method        VARCHAR(50) NOT NULL,
    Payer_First_Name      VARCHAR(50),
    Payer_Last_Name       VARCHAR(50),
    Card_Number           VARCHAR(20),
    Card_Expire_Date      DATE,
    Card_Type             VARCHAR(20),
    Bank_Name             VARCHAR(50),
    Account_Number        VARCHAR(50),
    Additional_Info       TEXT,
    Created_Date          DATE NOT NULL,
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID)
);
GO

-- =========================================
-- TABLE: Driver
-- =========================================
CREATE TABLE Driver (
    Driver_ID                           INT PRIMARY KEY,
    Policy_ID                           INT NOT NULL,
    Title                               VARCHAR(10),
    First_Name                          VARCHAR(50) NOT NULL,
    Last_Name                           VARCHAR(50) NOT NULL,
    Date_Of_Birth                       DATE NOT NULL,
    Email_Address                       VARCHAR(100),
    Phone_Number                        VARCHAR(20) NOT NULL,
    SSN                                 VARCHAR(20) NOT NULL,
    License_Issued_Date                 DATE NOT NULL,
    License_Issued_State                VARCHAR(20) NOT NULL,
    License_Number                      VARCHAR(50) NOT NULL,
    As_Primary_Policy_Holder            BIT NOT NULL,
    Primary_Policy_Holder_Relation      VARCHAR(50) NOT NULL,
    Gender                              VARCHAR(10) NOT NULL,
    Marital_Status                      VARCHAR(20),
    Created_Date                        DATE NOT NULL,
    Active                              BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
GO

-- =========================================
-- TABLE: Driver_Address
-- =========================================
CREATE TABLE Driver_Address (
    Driver_Address_ID   INT PRIMARY KEY,
    Driver_ID           INT NOT NULL,
    Address             VARCHAR(100) NOT NULL,
    Address_Line_2      VARCHAR(100),
    City                VARCHAR(50) NOT NULL,
    State               VARCHAR(50) NOT NULL,
    Zip_Code            VARCHAR(10) NOT NULL,
    Country             VARCHAR(50) NOT NULL,
    Is_Garage_Address   BIT NOT NULL,
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);
GO

-- =========================================
-- TABLE: Vehicle
-- =========================================
CREATE TABLE Vehicle (
    Vehicle_ID                INT PRIMARY KEY,
    Policy_ID                 INT NOT NULL,
    Year                      INT NOT NULL,
    Make                      VARCHAR(50) NOT NULL,
    Model                     VARCHAR(50) NOT NULL,
    Color                     VARCHAR(50),
    Mileage                   INT NOT NULL,
    VIN_Number                VARCHAR(50) NOT NULL,
    Vehicle_Number_Plate      VARCHAR(50) NOT NULL,
    Vehicle_Registered_State  VARCHAR(50) NOT NULL,
    Created_Date              DATE NOT NULL,
    Active                    BIT NOT NULL,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
GO

-- =========================================
-- TABLE: Vehicle_Driver
-- =========================================
CREATE TABLE Vehicle_Driver (
    Vehicle_Driver_ID  INT PRIMARY KEY,
    Vehicle_ID         INT NOT NULL,
    Driver_ID          INT NOT NULL,
    Drive_For_Business BIT NOT NULL,
    Is_Primary_Driver  BIT NOT NULL,
    Daily_Mileage      INT NOT NULL,
    Created_Date       DATE NOT NULL,
    Active             BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);
GO

-- =========================================
-- TABLE: Coverage
-- =========================================
CREATE TABLE Coverage (
    Coverage_ID       INT PRIMARY KEY,
    Coverage_Name     VARCHAR(200) NOT NULL,
    Coverage_Group    VARCHAR(150) NOT NULL,
    Code              VARCHAR(20) NOT NULL,
    Is_Policy_Coverage  BIT NOT NULL,
    Is_Vehicle_Coverage BIT NOT NULL,
    Description       VARCHAR(150)
);
GO

-- =========================================
-- TABLE: Policy_Coverage
-- =========================================
CREATE TABLE Policy_Coverage (
    Policy_Coverage_ID  INT PRIMARY KEY,
    Policy_ID           INT NOT NULL,
    Coverage_ID         INT NOT NULL,
    Active              BIT NOT NULL DEFAULT 1,
    Created_Date        DATE NOT NULL,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID),
    FOREIGN KEY (Coverage_ID) REFERENCES Coverage(Coverage_ID)
);
GO

-- =========================================
-- TABLE: Vehicle_Coverage
-- =========================================
CREATE TABLE Vehicle_Coverage (
    Vehicle_Coverage_ID  INT PRIMARY KEY,
    Vehicle_ID           INT NOT NULL,
    Coverage_ID          INT NOT NULL,
    Active				 BIT NOT NULL DEFAULT 1,
    Created_Date         DATE NOT NULL,
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY (Coverage_ID) REFERENCES Coverage(Coverage_ID)
);
GO

-- =========================================
-- TABLE: Traffic_Violation_Code
-- =========================================
CREATE TABLE Traffic_Violation_Code (
    Traffic_Violation_Code_ID  INT PRIMARY KEY,
    Violation_Question         TEXT NOT NULL,
    Violation_Code             VARCHAR(50) NOT NULL,
    Violation_Point            INT NOT NULL,
    Violation_Code_Description VARCHAR(50)
);
GO

-- =========================================
-- TABLE: Driver_Traffic_Violation_Record
-- =========================================
CREATE TABLE Driver_Traffic_Violation_Record (
    Driver_Violation_Record_ID     INT,
    Driver_ID                      INT NOT NULL,
    Traffic_Violation_Code_ID      INT NOT NULL,
    Active                         BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (Driver_Violation_Record_ID, Traffic_Violation_Code_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
    FOREIGN KEY (Traffic_Violation_Code_ID) REFERENCES Traffic_Violation_Code(Traffic_Violation_Code_ID)
);
GO