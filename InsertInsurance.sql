-- Insert into Policy
INSERT INTO Policy (Policy_ID, Policy_Number, Policy_Effective_Date, Policy_Expire_Date, Payment_Option, Total_Amount, Active, Additional_Info, Created_Date)
VALUES
(1, 'POL12345', '2024-01-01', '2025-01-01', 'Monthly', 1200.00, 1, 'First policy details', '2023-12-13'),
(2, 'POL67890', '2024-02-01', '2025-02-01', 'Once', 1500.00, 1, 'Second policy details', '2024-01-05'),
(3, 'POL24680', '2024-03-01', '2025-03-01', 'Monthly', 1300.00, 1, 'Third policy details', '2024-02-10'),
(4, 'POL13579', '2024-04-01', '2025-04-01', 'Monthly', 1400.00, 1, 'Fourth policy details', '2024-03-12'),
(5, 'POL35791', '2024-05-01', '2025-05-01', 'Monthly', 1600.00, 1, 'Fifth policy details', '2024-04-10'),
(6, 'POL46802', '2024-06-01', '2025-06-01', 'Monthly', 1700.00, 1, 'Sixth policy details', '2024-05-15'),
(7, 'POL57913', '2024-07-01', '2025-07-01', 'Once', 1800.00, 1, 'Seventh policy details', '2024-06-10'),
(8, 'POL68024', '2024-08-01', '2025-08-01', 'Monthly', 1900.00, 1, 'Eighth policy details', '2024-07-15'),
(9, 'POL90123', '2024-09-01', '2025-09-01', 'Once', 2100.00, 1, 'Ninth policy details', '2024-08-10'),
(10, 'POL90234', '2024-10-01', '2025-10-01', 'Monthly', 2200.00, 1, 'Tenth policy details', '2024-09-15');

-- Insert into Policy_Edit_Log
INSERT INTO Policy_Edit_Log (Policy_Edit_Log_ID, Policy_ID, Edited_Table_Name, Edited_Date, Additional_Info, Edited_By)
VALUES
(1, 1, 'Policy', '2023-12-15', 'Updated payment option', 'Admin1'),
(2, 2, 'Policy', '2024-01-20', 'Updated expire date', 'Admin2'),
(3, 3, 'Policy', '2024-02-15', 'Updated payment option', 'Admin3'),
(4, 4, 'Policy', '2024-03-20', 'Updated expire date', 'Admin4'),
(5, 5, 'Policy', '2024-04-20', 'Updated total amount', 'Admin5'),
(6, 6, 'Policy', '2024-05-25', 'Updated expire date', 'Admin6'),
(7, 7, 'Policy', '2024-06-20', 'Updated payment option', 'Admin7'),
(8, 8, 'Policy', '2024-07-25', 'Updated expire date', 'Admin8'),
(9, 9, 'Policy', '2024-08-20', 'Updated total amount', 'Admin9'),
(10, 10, 'Policy', '2024-09-25', 'Updated expire date', 'Admin10');

-- Insert into Bill
INSERT INTO Bill (Bill_ID, Policy_ID, Due_Date, Minimum_Payment, Created_Date, Balance, Status)
VALUES
(1, 1, '2024-01-30', 100.00, '2024-01-08', 1100.00, 'Unpaid'),
(2, 2, '2024-06-03', 150.00, '2024-02-03', 1350.00, 'Paid'),
(3, 3, '2024-06-15', 200.00, '2024-02-15', 1100.00, 'Unpaid'),
(4, 4, '2024-04-29', 250.00, '2024-04-08', 1150.00, 'Paid'),
(5, 5, '2024-08-15', 300.00, '2024-04-15', 1300.00, 'Unpaid'),
(6, 6, '2024-06-28', 400.00, '2024-05-28', 1300.00, 'Paid'),
(7, 7, '2024-10-15', 1800.00, '2024-06-15', 1800.00, 'Unpaid'),
(8, 8, '2024-08-19', 450.00, '2024-07-20', 1450.00, 'Paid'),
(9, 9, '2024-12-15', 2100.00, '2024-08-15', 2100.00, 'Unpaid'),
(10, 10, '2024-10-19', 500.00, '2024-09-20', 1700.00, 'Paid');

-- Insert into Payment_Detail
INSERT INTO Payment_Detail (Payment_Detail_ID, Bill_ID, Paid_Date, Amount, Payment_Method, Payer_First_Name, Payer_Last_Name, Card_Number, Card_Expire_Date, Card_Type, Bank_Name, Account_Number, Additional_Info, Created_Date)
VALUES
(1, 2, '2024-03-15', 150.00, 'Bank Transfer', 'Jane', 'Smith', NULL, NULL, NULL, 'Morgan Stanley', '107512706038', NULL, '2024-03-15'),
(2, 4, '2024-04-15', 250.00, 'Debit Card', 'Bob', 'Taylor', '0519274958590469', '2028-02-28', 'Mastercard', NULL, 'Capital One Bank', NULL, '2024-04-15'),
(3, 6, '2024-05-25', 400.00, 'Bank Transfer', 'David', 'Lee', NULL, NULL, NULL, 'CitiBank', '178923644615', NULL, '2024-05-25'),
(4, 8, '2024-08-05', 450.00, 'Bank Transfer', 'Daniel', 'Brown', NULL, NULL, NULL, 'PNC Bank', '107512706038', NULL, '2024-08-05'),
(5, 10, '2024-09-29', 500.00, 'Bank Transfer', 'Liam', 'Williams', NULL, NULL, NULL, 'Public Bank', '2558438253', NULL, '2024-09-29');

-- Insert into Driver
INSERT INTO Driver (Driver_ID, Policy_ID, Title, First_Name, Last_Name, Date_Of_Birth, Email_Address, Phone_Number, SSN, License_Issued_Date, License_Issued_State, License_Number, As_Primary_Policy_Holder,  Primary_Policy_Holder_Relation, Gender, Marital_Status, Created_Date, Active)
VALUES
(1, 1, 'Mr.', 'John', 'Doe', '1980-05-10', 'johndoe@example.com', '123-456-7890', '123-45-6789', '2015-06-10', 'NY', 'NYD-12345678', 1, 'Myself', 'Male', 'Married', '2023-10-07', 1),
(2, 2, 'Ms.', 'Jane', 'Smith', '1990-08-20', 'janesmith@example.com', '987-654-3210', '987-65-4321', '2017-09-15', 'NY', 'CAD-87654321', 1, 'Myself', 'Female', 'Single', '2024-05-02', 1),
(3, 3, 'Mr.', 'Alice', 'Brown', '1985-07-15', 'alicebrown@example.com', '111-222-3333', '456-78-9012', '2018-03-22', 'NY', 'TXD-45678912', 0, 'Son', 'Male', 'Divorced', '2024-02-18', 1),
(4, 4, 'Mr.', 'Bob', 'Taylor', '1978-11-05', 'bobtaylor@example.com', '444-555-6666', '654-32-1987', '2016-11-05', 'NY', 'FLD-23456789', 1, 'Myself', 'Male', 'Married', '2024-03-15', 1),
(5, 5, 'Ms.', 'Emma', 'Wilson', '1989-09-22', 'emmawilson@example.com', '555-666-7777', '321-54-8765', '2019-07-30', 'WA', 'ILD-78901234', 1, 'Myself', 'Female', 'Married', '2024-04-12', 1),
(6, 6, 'Mr.', 'David', 'Lee', '1995-12-30', 'davidlee@example.com', '777-888-9999', '789-12-3456', '2014-05-12', 'WA', 'WAD-56789012', 0, 'Father', 'Male', 'Married', '2024-05-18', 1),
(7, 7, 'Ms.', 'Olivia', 'Martinez', '1985-04-12', 'oliviamartinez@example.com', '333-444-5555', '234-56-7890', '2020-01-25', 'WA', 'NVD-34567890', 1, 'Myself', 'Female', 'Engaged', '2024-06-12', 1),
(8, 8, 'Mr.', 'Daniel', 'Brown', '1992-07-18', 'danielbrown@example.com', '888-999-0000', '876-54-3210', '2021-08-19', 'AZ', 'GAD-90817263', 0, 'Wife', 'Male', 'Married', '2024-07-18', 1),
(9, 9, 'Mr.', 'Emma', 'Johnson', '1993-06-25', 'emmajohnson@example.com', '222-333-4444', '543-21-6789', '2013-12-07', 'AZ', 'AZD-12983746', 1, 'Myself', 'Male', 'Married', '2024-08-12', 1),
(10, 10, 'Ms.', 'Liam', 'Williams', '1988-09-30', 'liamwilliams@example.com', '555-666-7777', '678-90-1234', '2016-04-14', 'AZ', 'OHD-19283746', 1, 'Myself', 'Female', 'Separated', '2024-09-18', 1);

-- Insert into Driver_Address
INSERT INTO Driver_Address (Driver_Address_ID, Driver_ID, Address, City, State, Zip_Code, Country, Is_Garage_Address)
VALUES
(1, 1, '123 Main St', 'New York', 'NY', '10001', 'USA', 1),
(2, 2, '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA', 0),
(3, 3, '789 Pine St', 'Chicago', 'IL', '60601', 'USA', 1),
(4, 4, '101 Maple Ave', 'Houston', 'TX', '77001', 'USA', 0),
(5, 5, '202 Elm St', 'Seattle', 'WA', '98101', 'USA', 1),
(6, 6, '303 Birch Rd', 'Denver', 'CO', '80202', 'USA', 0),
(7, 7, '404 Cedar St', 'Austin', 'TX', '73301', 'USA', 1),
(8, 8, '505 Pine Ln', 'Phoenix', 'AZ', '85001', 'USA', 0),
(9, 9, '606 Birch Ave', 'Denver', 'CO', '80202', 'USA', 1),
(10, 10, '707 Spruce Rd', 'Seattle', 'WA', '98101', 'USA', 0);

-- Insert into Vehicle
INSERT INTO Vehicle (Vehicle_ID, Policy_ID, Year, Make, Model, Color, Mileage, VIN_Number, Vehicle_Number_Plate, Vehicle_Registered_State, Created_Date, Active)
VALUES
(1, 1, 2020, 'Toyota', 'Camry', 'Blue', 75432, '1HGCM82633A123456', '7XRT392', 'California', '2023-11-01', 1),
(2, 2, 2019, 'Honda', 'Civic', 'Red', 128940, '2HGFA16589H123457', 'JPD-8274', 'Texas', '2024-05-25', 1),
(3, 3, 2021, 'Ford', 'Focus', 'White', 60321, '3HGCM82633A123458', 'KMT-5421', 'New York', '2024-02-18', 1),
(4, 4, 2022, 'Chevrolet', 'Malibu', 'Black', 45100, '4HGCM82633A123459', 'LBN M82', 'Florida', '2024-03-15', 1),
(5, 5, 2023, 'Nissan', 'Altima', 'Silver', 98760, '5HGCM82633A123460', 'TR 38529', 'Illinois', '2024-04-12', 1),
(6, 6, 2022, 'Tesla', 'Model 3', 'Gray', 23456, '6HGCM82633A123461', 'XQZ 2094', 'Ohio', '2024-05-18', 1),
(7, 7, 2021, 'Ford', 'Focus', 'Black', 87990, '7HGCM82633A123462', 'VRM5623', 'Georgia', '2024-06-12', 1),
(8, 8, 2020, 'Chevrolet', 'Malibu', 'White', 112345, '8HGCM82633A123463', 'HJL-9372', 'Pennsylvania', '2024-07-18', 1),
(9, 9, 2022, 'Tesla', 'Model 3', 'Silver', 65987, '9HGCM82633A123464', 'BVT 4628', 'Michigan', '2024-08-12', 1),
(10, 10, 2021, 'BMW', 'X5', 'Blue', 34789, '0HGCM82633A123465', 'FMC-8145', 'North Carolina', '2024-09-18', 1);

-- Insert into Vehicle_Driver
INSERT INTO Vehicle_Driver (Vehicle_Driver_ID, Vehicle_ID, Driver_ID, Drive_For_Business, Is_Primary_Driver, Daily_Mileage, Created_Date, Active)
VALUES
(1, 1, 1, 0, 1, 12, '2023-11-01', 1),
(2, 2, 2, 1, 1, 25, '2024-05-25', 1),
(3, 3, 3, 0, 1, 8, '2024-02-18', 1),
(4, 4, 4, 1, 1, 30, '2024-03-15', 1),
(5, 5, 5, 1, 1, 15, '2024-04-12', 1),
(6, 6, 6, 0, 1, 40, '2024-05-18', 1),
(7, 7, 7, 1, 1, 22, '2024-06-12', 1),
(8, 8, 8, 0, 1, 18, '2024-07-18', 1),
(9, 9, 9, 0, 1, 35, '2024-08-12', 1),
(10, 10, 10, 1, 1, 10, '2024-09-18', 1);

-- Insert into Coverage
INSERT INTO Coverage (Coverage_ID, Coverage_Name, Coverage_Group, Code, Is_Policy_Coverage, Is_Vehicle_Coverage, Description)
VALUES
(1, 'Liability Coverage', 'Standard', 'LC100', 1, 0, 'Basic liability coverage'),
(2, 'Collision Coverage', 'Comprehensive', 'CC200', 0, 1, 'Covers collision damage'),
(3, 'Personal Injury Protection', 'Standard', 'PIP300', 1, 0, 'Covers medical expenses regardless of fault'),
(4, 'Uninsured Motorist Coverage', 'Comprehensive', 'UM400', 0, 1, 'Covers damages from uninsured drivers'),
(5, 'Comprehensive Coverage', 'Comprehensive', 'CC500', 1, 0, 'Covers theft, vandalism, and weather damage'),
(6, 'Roadside Assistance', 'Additional', 'RA600', 0, 1, 'Provides towing and roadside service'),
(7, 'Uninsured Motorist Coverage', 'Standard', 'UM700', 1, 0, 'Covers damages from uninsured drivers'),
(8, 'Personal Injury Protection', 'Additional', 'PIP800', 0, 1, 'Covers medical expenses regardless of fault'),
(9, 'Roadside Assistance', 'Additional', 'RA900', 1, 0, 'Covers towing and roadside help'),
(10, 'Comprehensive Coverage', 'Full', 'CC1000', 0, 1, 'Covers non-collision damage');

-- Insert into Policy_Coverage
INSERT INTO Policy_Coverage (Policy_Coverage_ID, Policy_ID, Coverage_ID, Active, Created_Date)
VALUES
(1, 1, 1, 1, '2023-12-13'),
(2, 2, 1, 1, '2024-01-05'),
(3, 3, 3, 1, '2024-02-10'),
(4, 4, 3, 1, '2024-03-12'),
(5, 5, 5, 1, '2024-04-10'),
(6, 6, 5, 1, '2024-05-15'),
(7, 7, 7, 1, '2024-06-10'),
(8, 8, 7, 1, '2024-07-15'),
(9, 9, 9, 1, '2024-08-10'),
(10, 10, 9, 1, '2024-09-15');

-- Insert into Vehicle_Coverage
INSERT INTO Vehicle_Coverage (Vehicle_Coverage_ID, Vehicle_ID, Coverage_ID, Active, Created_Date)
VALUES
(1, 1, 2, 1, '2023-11-01'),
(2, 2, 2, 1, '2024-05-25'),
(3, 3, 4, 1, '2024-02-18'),
(4, 4, 4, 1, '2024-03-15'),
(5, 5, 6, 1, '2024-04-12'),
(6, 6, 6, 1, '2024-05-18'),
(7, 7, 8, 1, '2024-06-12'),
(8, 8, 8, 1, '2024-07-18'),
(9, 9, 10, 1, '2024-08-12'),
(10, 10, 10, 1, '2024-09-18');

-- Insert into Traffic_Violation_Code
INSERT INTO Traffic_Violation_Code (Traffic_Violation_Code_ID, Violation_Question, Violation_Code, Violation_Point, Violation_Code_Description)
VALUES
(1, 'Did the driver drive without a seatbelt?', 'SB100', 1, 'No seatbelt violation'),
(2, 'Did the driver fail to yield?', 'FY200', 2, 'Failure to yield violation'),
(3, 'Was the driver speeding?', 'SP300', 3, 'Speeding violation'),
(4, 'Was the driver using a mobile phone while driving?', 'MP400', 4, 'Using a mobile phone while driving'),
(5, 'Did the driver run a red light?', 'RL500', 5, 'Running a red light'),
(6, 'Was the driver driving without insurance?', 'NI600', 6, 'No insurance violation'),
(7, 'Did the driver make an illegal U-turn?', 'UT700', 2, 'Illegal U-turn'),
(8, 'Was the driver involved in hit and run?', 'HR800', 10, 'Hit and run violation'),
(9, 'Did the driver fail to stop at a stop sign?', 'SS900', 3, 'Failed to stop at stop sign'),
(10, 'Did the driver drive under the influence of alcohol?', 'DUI1000', 12, 'DUI - Alcohol'),
(11, 'Did the driver drive under the influence of drugs?', 'DUID1100', 12, 'DUI - Drugs'),
(12, 'Did the driver perform aggressive driving?', 'AD1200', 5, 'Aggressive driving'),
(13, 'Was the driver tailgating?', 'TG1300', 2, 'Tailgating'),
(14, 'Did the driver use the wrong lane?', 'WL1400', 3, 'Wrong lane usage'),
(15, 'Did the driver overtake in a no-overtaking zone?', 'NO1500', 4, 'Improper overtaking'),
(16, 'Was the vehicle overloaded?', 'OV1600', 3, 'Overloaded vehicle'),
(17, 'Did the driver refuse to take a breathalyzer test?', 'BT1700', 6, 'Refused breathalyzer test'),
(18, 'Did the driver drive with a suspended license?', 'SL1800', 7, 'Driving with suspended license'),
(19, 'Did the driver park in a no-parking zone?', 'NP1900', 1, 'Illegal parking'),
(20, 'Did the driver cross a railway crossing illegally?', 'RC2000', 4, 'Illegal railway crossing');

-- Insert into Driver_Traffic_Violation_Record
INSERT INTO Driver_Traffic_Violation_Record (Driver_Violation_Record_ID, Driver_ID, Traffic_Violation_Code_ID, Active)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1),
(11, 1, 12, 1),
(12, 1, 2, 1),
(13, 3, 3, 1),
(14, 1, 4, 1),
(15, 5, 15, 1),
(16, 2, 16, 1),
(17, 7, 7, 1),
(18, 4, 18, 1),
(19, 9, 9, 1),
(20, 7, 10, 1),
(21, 1, 12, 1),
(22, 6, 2, 1),
(23, 3, 3, 1),
(24, 1, 4, 1),
(25, 5, 15, 1),
(26, 1, 16, 1),
(27, 7, 7, 1),
(28, 8, 18, 1),
(29, 9, 9, 1),
(30, 7, 10, 1);