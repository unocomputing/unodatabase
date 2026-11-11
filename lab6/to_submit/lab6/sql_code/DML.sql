INSERT INTO Person (pid, firstName, lastName, email, affiliation, startDate, endDate) VALUES
(1,  'Karim',   'Alaoui',     'karim.alaoui@um6p.ma',     'UM6P',     '2015-09-01', NULL),
(2,  'Salma',   'Benjelloun', 'salma.benjelloun@um6p.ma', 'UM6P',     '2018-09-01', NULL),
(3,  'Youssef', 'Idrissi',    'youssef.idrissi@um6p.ma',  'UM6P',     '2017-02-01', NULL),
(4,  'Amine',   'Tazi',       'amine.tazi@um6p.ma',       'UM6P',     '2020-01-15', NULL),
(5,  'Nadia',   'El Fassi',   'nadia.elfassi@um6p.ma',    'UM6P',     '2023-09-01', '2026-06-30'),
(6,  'Omar',    'Berrada',    'omar.berrada@um6p.ma',     'UM6P',     '2019-05-01', NULL),
(7,  'Rania',   'Chraibi',    'rania.chraibi@um6p.ma',    'UM6P',     '2021-03-01', NULL),
(8,  'Hassan',  'Lahlou',     'hassan.lahlou@um6p.ma',    'UM6P',     '2016-10-01', NULL),
(9,  'Imane',   'Kabbaj',     'imane.kabbaj@um6p.ma',     'UM6P',     '2025-09-01', NULL),
(10, 'Mehdi',   'Cherkaoui',  'mehdi.cherkaoui@um6p.ma',  'UM6P',     '2024-09-01', NULL),
(11, 'Sara',    'Mounir',     'sara.mounir@gmail.com',    'External', '2026-09-01', NULL);

INSERT INTO Student (pid, program) VALUES
(9,  'MSc'),
(10, 'PhD'),
(11, 'BEng');

INSERT INTO Employee (pid, phone, office, position, supervisorPid) VALUES
(1, '0525073001', 'A-101',   'dean',       NULL),
(2, '0525073002', 'B-210',   'faculty',    1),
(3, '0525073003', 'B-211',   'faculty',    1),
(4, '0525073004', 'B-215',   'scientist',  2),
(5, '0525073005', 'B-216',   'postdoc',    3),
(6, '0525073006', 'Lab-101', 'technician', 2),
(7, '0525073007', 'Lab-204', 'engineer',   3),
(8, '0525073008', 'A-105',   'secretary',  1);

INSERT INTO Academic       (pid) VALUES (1), (2), (3), (4), (5);
INSERT INTO Faculty        (pid) VALUES (2), (3);
INSERT INTO Technical      (pid) VALUES (6), (7);
INSERT INTO Administrative (pid) VALUES (8);

INSERT INTO Advises (academicPid, studentPid) VALUES
(2, 9), (4, 9), (3, 10), (2, 11);

-- ---------- Laboratories ----------
INSERT INTO Laboratory (labId, name, building, roomNumber, discipline, supervisorPid) VALUES
(1, 'Physics Laboratory',   'Riad5',      '101', 'Physics',   2),
(2, 'Chemistry Laboratory', 'Building A', '204', 'Chemistry', 3),
(3, 'Biology Laboratory',   'Building B', '15',  'Biology',   2);

INSERT INTO Attached (pid, labId) VALUES
(2, 1), (6, 1), (9, 1),
(3, 2), (7, 2), (10, 2),
(2, 3), (4, 3), (11, 3);

-- ---------- Research projects ----------
INSERT INTO ResearchProject (code, title, startDate, endDate, status) VALUES
('RP-001', 'Quantum Sensing',           '2026-01-01', '2027-12-31', 'Active'),
('RP-002', 'Green Catalysts',           '2025-09-01', '2026-12-31', 'Active'),
('RP-003', 'Cell Imaging Pipeline',     '2026-03-01', '2027-03-01', 'Proposed'),
('RP-004', 'Legacy Spectroscopy Study', '2024-01-01', '2025-06-30', 'Cancelled'),
('RP-005', 'Solar Thermometry',         '2025-01-01', '2026-05-31', 'Completed');

INSERT INTO Participates (pid, projectCode, role) VALUES
(2,  'RP-001', 'PI'),
(4,  'RP-001', 'Co-PI'),
(6,  'RP-001', 'Collaborator'),
(9,  'RP-001', 'Collaborator'),
(3,  'RP-002', 'PI'),
(7,  'RP-002', 'Collaborator'),
(10, 'RP-002', 'Collaborator'),
(4,  'RP-003', 'PI'),
(11, 'RP-003', 'Collaborator'),
(3,  'RP-004', 'PI'),
(5,  'RP-004', 'Collaborator'),
(2,  'RP-005', 'PI'),
(5,  'RP-005', 'Co-PI'),
(6,  'RP-005', 'Collaborator');

-- ---------- Budgets ----------
INSERT INTO Budget (budgetLine, amountGranted, amountDisbursed, startDate, endDate, managerPid) VALUES
('BL-PHY-2026',   500000.00, 120000.00, '2026-01-01', '2026-12-31', 2),
('BL-CHEM-2026',  350000.00,  90000.00, '2026-01-01', '2026-12-31', 3),
('BL-QSENS-2026', 800000.00, 200000.00, '2026-01-01', '2027-12-31', 4),
('BL-BIO-2026',   150000.00,  25000.00, '2026-01-01', '2026-12-31', 2);

INSERT INTO FundsLab (budgetLine, labId) VALUES
('BL-PHY-2026',   1),
('BL-QSENS-2026', 1),
('BL-CHEM-2026',  2),
('BL-BIO-2026',   3);

INSERT INTO FundsPrj (budgetLine, projectCode) VALUES
('BL-QSENS-2026', 'RP-001'),
('BL-PHY-2026',   'RP-001'),
('BL-CHEM-2026',  'RP-002'),
('BL-BIO-2026',   'RP-003'),
('BL-CHEM-2026',  'RP-004'),
('BL-PHY-2026',   'RP-005');

-- ---------- Equipment (model 4 has no units) ----------
INSERT INTO EquipmentModel (modelId, commercialName, manufacturer, category, requiredEnvironment, trainingMandatory) VALUES
(1, 'LumiScope 100',          'Optika Systems', 'Optical Microscope', 'Clean room, 18-24 C',  TRUE),
(2, 'LumiScope 200 Confocal', 'Optika Systems', 'Optical Microscope', 'Vibration-free table', TRUE),
(3, 'ThermoPro 10',           'Thermis',        'Thermometer',        'Room temperature',     FALSE),
(4, 'SpectraMax 30',          'Spectra Inc',    'Spectrometer',       'Dark room',            TRUE);

INSERT INTO EquipmentUnit (serialNo, acquisitionDate, purchaseCost, status, portable, modelId, labId) VALUES
('SN-OM100-001', '2024-02-10', 45000.00, 'InService',        FALSE, 1, 1),
('SN-OM100-002', '2024-02-10', 45000.00, 'UnderMaintenance', FALSE, 1, 1),
('SN-OM200-001', '2025-05-20', 98000.00, 'InService',        FALSE, 2, 1),
('SN-TH10-001',  '2023-11-05',   350.00, 'InService',        TRUE,  3, 1),
('SN-TH10-002',  '2023-11-05',   350.00, 'InService',        TRUE,  3, 2),
('SN-OM100-003', '2025-09-15', 47000.00, 'InService',        FALSE, 1, 3),
('SN-TH10-003',  '2022-04-01',   340.00, 'Retired',          TRUE,  3, 3);

-- ---------- Certifications (validityPeriod in months) ----------
INSERT INTO Certification (code, title, issuingAuthority, validityPeriod, safetyLevel) VALUES
('CERT-LASER', 'Laser Safety',               'National Safety Board', 60, 'High'),
('CERT-OPT',   'Optical Equipment Training', 'UM6P Training Office',  60, 'Medium'),
('CERT-CLEAN', 'Cleanroom Access',           'UM6P Training Office',  60, 'Medium');

INSERT INTO Requires (modelId, certCode) VALUES
(1, 'CERT-OPT'),
(2, 'CERT-LASER'),
(2, 'CERT-OPT'),
(4, 'CERT-LASER');

INSERT INTO Holds (pid, certCode, issueDate, expirationDate, grade) VALUES
(2, 'CERT-LASER', '2025-06-30', '2030-06-30', '85'),
(4, 'CERT-LASER', '2025-03-31', '2030-03-31', '78'),
(2, 'CERT-OPT',   '2025-09-30', '2030-09-30', '90'),
(4, 'CERT-OPT',   '2025-09-30', '2030-09-30', '88'),
(6, 'CERT-OPT',   '2025-01-31', '2030-01-31', '92'),
(9, 'CERT-OPT',   '2025-10-15', '2030-10-15', NULL),
(6, 'CERT-CLEAN', '2026-02-28', '2031-02-28', '75'),
(7, 'CERT-CLEAN', '2026-02-28', '2031-02-28', '80');

INSERT INTO Reservation (resId, submissionTS, plannedStart, plannedEnd, purpose, status, madeByPid, projectCode, approverPid) VALUES
(1, NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 5 DAY, NOW() + INTERVAL 5 DAY + INTERVAL 4 HOUR,
    'Confocal imaging of sample batch',   'Approved',  2, 'RP-001', 1),
(2, '2026-11-04 10:00:00', '2026-11-10 09:00:00', '2026-11-10 12:00:00',
    'Temperature calibration run',        'Pending',   3, 'RP-002', NULL),
(3, '2026-11-05 14:30:00', '2026-11-20 09:00:00', '2026-11-20 17:00:00',
    'Reference temperature measurements', 'Pending',   3, 'RP-004', NULL),
(4, '2026-09-20 09:15:00', '2026-10-01 09:00:00', '2026-10-01 17:00:00',
    'Extended confocal session',          'Rejected',  4, 'RP-001', NULL),
(5, '2026-09-25 11:00:00', '2026-10-10 10:00:00', '2026-10-10 12:00:00',
    'Thermometer comparison',             'Cancelled', 7, 'RP-002', NULL),
(6, '2026-08-01 08:30:00', '2026-08-10 09:00:00', '2026-08-12 17:00:00',
    'Microscope observation of samples',  'Completed', 6, 'RP-005', 3),
(7, '2026-11-03 16:00:00', '2026-11-25 09:00:00', '2026-11-26 17:00:00',
    'Cell morphology imaging',            'Approved',  9, 'RP-001', 3);

INSERT INTO Reserves (resId, serialNo) VALUES
(1, 'SN-OM200-001'),
(1, 'SN-TH10-001'),
(2, 'SN-TH10-002'),
(3, 'SN-TH10-002'),
(4, 'SN-OM200-001'),
(5, 'SN-TH10-001'),
(6, 'SN-OM100-001'),
(6, 'SN-OM100-003'),
(7, 'SN-OM100-003');

INSERT INTO Maintenance (serialNo, startTS, endTS, type, description, cost, outcome, technicalPid) VALUES
('SN-OM100-002', '2026-10-12 09:00:00', '2026-10-20 17:00:00', 'Corrective', 'Replace faulty light source', 1200.00, 'FollowUpRequired', 6),
('SN-OM100-001', '2026-06-01 09:00:00', '2026-06-01 12:00:00', 'Preventive', 'Annual lens cleaning',         300.00, 'Resolved',         6),
('SN-OM200-001', '2026-07-15 09:00:00', '2026-07-16 17:00:00', 'Preventive', 'Alignment check',              500.00, 'Resolved',         7);

INSERT INTO CalibrationRecord (serialNo, calibDate, calibrationType, result, nextDueDate, remarks) VALUES
('SN-TH10-001',  '2025-03-01', 'Annual',  'Adjusted', '2026-03-01', 'Offset corrected by 0.2 C'),
('SN-TH10-001',  '2026-03-01', 'Annual',  'Pass',     '2027-03-01', 'Within tolerance'),
('SN-TH10-002',  '2026-04-10', 'Annual',  'Pass',     '2027-04-10', 'Within tolerance'),
('SN-OM200-001', '2026-05-05', 'Routine', 'Fail',     '2026-08-05', 'Focus drift detected');

INSERT INTO Consumable (consId, name, unitOfMeasure, hazardLevel, reorderThreshold) VALUES
(1, 'Nitrile Gloves', 'box',    'None', 20.00),
(2, 'Ethanol 96%',    'liter',  'High', 10.00),
(3, 'Immersion Oil',  'bottle', 'Low',   5.00),
(4, 'Filter Paper',   'pack',   'None', 15.00);

INSERT INTO Supplier (suppId, name, contactEmail, phone) VALUES
(1, 'LabSupply Maroc',    'sales@labsupply.ma',   '0522334455'),
(2, 'ChemPro',            'orders@chempro.com',   '0537112233'),
(3, 'OptiConsumables',    'contact@opticons.com', '0528445566'),
(4, 'Temporary Test Co.', 'test@example.com',     '0500000000');

INSERT INTO Supplies (suppId, consId, labId, unitPrice) VALUES
(1, 1, 1,  45.00),
(1, 1, 2,  42.50),
(2, 1, 1,  48.00),
(2, 2, 2, 120.00),
(1, 2, 2, 125.00),
(2, 2, 3, 118.00),
(3, 3, 1, 300.00),
(1, 4, 2,  25.00);

INSERT INTO Stocks (labId, consId, quantityOnHand, lastRestockDate, storageCondition, technicalPid, monitoringSince) VALUES
(1, 1, 40.00, '2026-10-01', 'Dry, room temperature', 6, '2026-01-15'),
(2, 1, 15.00, '2026-09-10', 'Dry, room temperature', 7, '2026-02-01'),
(2, 2, 30.00, '2026-10-10', 'Flammable cabinet',     7, '2026-02-01'),
(1, 3, 12.00, '2026-09-20', 'Cool, dark place',      6, '2026-03-01'),
(3, 2, 25.00, '2026-08-30', 'Flammable cabinet',     6, '2026-03-15');

INSERT INTO Consumes (resId, labId, consId, quantityUsed) VALUES
(1, 1, 1, 2.00),
(6, 1, 1, 3.00),
(6, 1, 3, 1.00),
(6, 3, 2, 2.00);

-- 1. New person + subtype record (+ advisor)
INSERT INTO Person (pid, firstName, lastName, email, affiliation, startDate, endDate)
VALUES (12, 'Layla', 'Zniber', 'layla.zniber@um6p.ma', 'UM6P', '2026-11-07', NULL);
INSERT INTO Student (pid, program) VALUES (12, 'MSc');
INSERT INTO Advises (academicPid, studentPid) VALUES (2, 12);

INSERT INTO EquipmentUnit (serialNo, acquisitionDate, purchaseCost, status, portable, modelId, labId)
VALUES ('SN-TH10-004', '2026-11-05', 360.00, 'InService', TRUE, 3, 2);

INSERT INTO Reservation (resId, submissionTS, plannedStart, plannedEnd, purpose, madeByPid, projectCode)
VALUES (8, NOW(), NOW() + INTERVAL 10 DAY, NOW() + INTERVAL 10 DAY + INTERVAL 2 HOUR,
        'Thermometer cross-check', 3, 'RP-002');
INSERT INTO Reserves (resId, serialNo) VALUES (8, 'SN-TH10-004');

UPDATE Reservation
SET status = 'Approved', approverPid = 1
WHERE resId = 2 AND status = 'Pending';

UPDATE Stocks
SET quantityOnHand = quantityOnHand - 1
WHERE labId = 3 AND consId = 2;

INSERT INTO Consumes (resId, labId, consId, quantityUsed) VALUES (7, 3, 2, 1.00);

UPDATE Reservation
SET status = 'Cancelled'
WHERE status = 'Pending'
  AND projectCode IN (SELECT code FROM ResearchProject WHERE status = 'Cancelled');

DELETE FROM Supplier WHERE suppId = 4;


-- ------------ PART 3

SELECT pid,firstName,lastName,email 
FROM Person
Order by LastName ASC, firstName ASC;

SELECT DISTINCT discipline
From Laboratory;

SELECT *
FROM Person
WHERE email LIKE '%@um6p.ma';

SELECT *
FROM person
WHERE endDate IS NULL;

SELECT *
FROM Reservation
WHERE plannedStart>='2026-11-01' AND plannedStart<'2026-12-01';

-- PART B
SELECT firstName,lastName,title,Pa.role
FROM Person Pr
JOIN Participates Pa ON Pa.pid = Pr.pid
JOIN ResearchProject Rs ON projectcode = Rs.code;

SELECT budgetLine, firstName, lastName
FROM Budget 
JOIN Academic Ac ON Ac.pid = managerPid
JOIN Person Pr ON Pr.pid = Ac.pid;

SELECT resId, firstName, lastName,title
FROM Reservation R 
JOIN Person ON madeByPid = pid
JOIN ResearchProject Rp ON projectCode = Rp.code;

SELECT resId, R.serialNo, commercialName,lab.name
FROM Reserves R
JOIN EquipmentUnit Eu ON Eu.serialNo = R.serialNo
JOIN EquipmentModel Em ON Eu.modelId = Em.modelId
JOIN Laboratory lab ON Eu.labId = lab.labId;

SELECT firstName,lastName,resId
FROM Reservation 
JOIN Person ON pid = approverPid
WHERE status = 'Approved';

SELECT Lab.name, Cmble.name,firstName,lastName,quantityOnHand
FROM Stocks Stk
JOIN Laboratory Lab ON Lab.labId = Stk.labId
JOIN Consumable Cmble ON Cmble.consId = Stk.consId
JOIN Person Prs ON Prs.pid = technicalPid;

-- PART C

SELECT labId, COUNT(serialNo) AS total_units
FROM equipmentunit
GROUP BY labId;

SELECT consId, SUM(quantityUsed) AS total_quantity
FROM Consumes
GROUP BY consId;

-- PART D
SELECT Lb.labId ,count(*) AS numberOfUnit
FROM Laboratory Lb
JOIN EquipmentUnit E ON E.labId = Lb.labId
GROUP BY Lb.labId
HAVING COUNT(serialNo)>3;

SELECT RP.title, SUM(amountGranted) AS totalGranted
FROM ResearchProject RP
JOIN FundsPrj FP ON projectCode = RP.Code
JOIN Budget Bg ON FP.BudgetLine = Bg.BudgetLine
GROUP BY RP.Code;

SELECT Lab.name,EM.category,COUNT(*) AS numberOfUnits,AVG(Ep.purchaseCost) AS averageCost
FROM EquipmentUnit Ep
JOIN Laboratory Lab ON Ep.labId = Lab.labId
JOIN EquipmentModel EM ON Ep.modelId = EM.modelId
GROUP BY Lab.labId, EM.category;

SELECT Spp.suppId, Spp.name, COUNT(DISTINCT SP.consId) AS numberOfConsumables
FROM Supplier Spp
LEFT JOIN Supplies SP ON Spp.suppId = SP.suppId
GROUP BY Spp.suppId;

SELECT Lab.name , Cmble.name ,MIN(Supp.unitPrice) AS lowestPrice
FROM Supplies Supp
JOIN Laboratory Lab ON Supp.labId = Lab.labId
JOIN Consumable Cmble ON Supp.consId = Cmble.consId
GROUP BY Lab.labId, Cmble.consId;

SELECT Resv.resId,Pr.firstName, Pr.lastName,SUM(Cn.quantityUsed) AS totalUsed
FROM Reservation Resv
JOIN Person Pr ON Resv.madeByPid = Pr.pid
JOIN Consumes Cn ON Resv.resId = Cn.resId
GROUP BY Resv.resId, Pr.pid, Pr.firstName, Pr.lastName;

-- PART E

SELECT p.pid, p.firstName, p.lastName
FROM Person AS p, Laboratory AS l
WHERE p.pid = l.supervisorPid

INTERSECT

SELECT p.pid, p.firstName, p.lastName
FROM Person AS p, Budget AS b
WHERE p.pid = b.managerPid;


SELECT p.pid, p.firstName, p.lastName
FROM Person AS p
WHERE p.pid NOT IN (
    SELECT r.madeByPid
    FROM Reservation AS r
);


SELECT eu.*
FROM EquipmentUnit AS eu
WHERE NOT EXISTS (
    SELECT r.serialNo
    FROM Reserves AS r
    WHERE r.serialNo = eu.serialNo
);


SELECT eu.serialNo, eu.purchaseCost
FROM EquipmentUnit AS eu
WHERE eu.purchaseCost >= ALL (
    SELECT eu2.purchaseCost
    FROM EquipmentUnit AS eu2
);

-- PART F

select DISTINCT R.model_id, H.pid from Requires R, Holds H 
	where not exists (select * 
			from Requires R2 
			where R2.model_id = R.model_id
			and not exists (
				select * from Holds H2 where H2.pid = H.pid
						       and H2.cert_code = R2.code
			) 
							  
			);



