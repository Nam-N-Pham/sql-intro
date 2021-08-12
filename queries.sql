CREATE TABLE "Employees" (
  "FullName"        TEXT NOT NULL,
  "Salary"          INT NOT NULL,
  "JobPosition"     TEXT NOT NULL,
  "PhoneExtension"  INT,
  "IsPartTime"      BOOLEAN,
  "Id"              SERIAL PRIMARY KEY
);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Nam Pham', '1000', 'software developer', '727', 'false');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Kate Howard', '500', 'junior developer', '813', 'true');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gordon Ramsay', '2000', 'cook', '900', 'false');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', '100', 'customer service', '100', 'true');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Guy Fieri', '1500', 'cook', '727', 'false');

SELECT * FROM "Employees";

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = false;

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jake Baker', '450', 'software developer', '727', 'true');

UPDATE "Employees"
SET "Salary" = 500
WHERE "JobPosition" = 'cook';

DELETE FROM "Employees"
WHERE "FullName" = 'Lazy Larry';

ALTER TABLE "Employees"
ADD COLUMN "ParkingSpot" VARCHAR(10);




CREATE TABLE "Departments" (
  "Id"              SERIAL PRIMARY KEY,
  "DepartmentName"  TEXT,
  "Building"        TEXT
);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER REFERENCES "Departments" ("Id");

CREATE TABLE "Products" (
  "Id"              SERIAL PRIMARY KEY,
  "Price"           NUMERIC,
  "Name"            TEXT,
  "Description"     TEXT,
  "QuantityInStock" INT
);

CREATE TABLE "Orders" (
  "Id"              SERIAL PRIMARY KEY,
  "OrderNumber"     TEXT,
  "DatePlace"       DATE,
  "Email"           TEXT
);

CREATE TABLE "ProductOrders" (
  "OrderID"         INTEGER REFERENCES "Orders" ("Id"),
  "ProductID"       INTEGER REFERENCES "Products" ("Id"),
  "OrderQuantity"   INT
);

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', '40000', 'Programmer', '123', 'false', '1');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', '80000', 'Manager', '234', 'false', '1');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', '32000', 'Admin', '456', 'true', '2');

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ('12.45', 'Widget', 'The Original Widget', '100');

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ('99.99', 'Flowbee', 'Perfect for haircuts', '3');

INSERT INTO "Orders" ("OrderNumber", "DatePlace", "Email")
VALUES ('X529', '2020-01-01', 'person@example.com');

INSERT INTO "ProductOrders" ("OrderID", "ProductID", "OrderQuantity")
VALUES ('1', '1', '3');

INSERT INTO "ProductOrders" ("OrderID", "ProductID", "OrderQuantity")
VALUES ('1', '2', '2');

SELECT "Employees"."FullName"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North';

SELECT "Employees"."FullName"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'East';

SELECT "Employees"."FullName"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'Main';

SELECT *
FROM "Products"
JOIN "ProductOrders" ON "Products"."Id" = "ProductOrders"."ProductID"
JOIN "Orders" ON "ProductOrders"."OrderID" = "Orders"."Id"
WHERE "ProductOrders"."ProductID" = 2;

SELECT "Products"."QuantityInStock"
FROM "Orders"
JOIN "ProductOrders" ON "Orders"."Id" = "ProductOrders"."OrderID"
JOIN "Products" ON "ProductOrders"."ProductID" = "Products"."Id"
WHERE "Products"."Name" = 'Flowbee' AND "Orders"."OrderNumber" = 'X529';